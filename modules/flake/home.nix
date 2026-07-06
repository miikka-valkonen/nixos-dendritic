{
  inputs,
  lib,
  config,
  ...
}: {
  options.configurations.homeManager = lib.mkOption {
    type = lib.types.lazyAttrsOf (
      lib.types.submodule {
        options.hostModule = lib.mkOption {
          type = lib.types.deferredModule;
        };
      }
    );
  };

  config.flake = {
    homeConfigurations = lib.flip lib.mapAttrs config.configurations.homeManager (
      name: let
        host = config.configurations.nixos.${name};
        pkgs = import inputs.nixpkgs {
          inherit (host) system;
          config.allowUnfree = host.allowUnfree;
        };
      in
        {hostModule, ...}:
          inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              inherit (host) user externalDevices;
            };
            modules = [
              config.flake.modules.homeManager.stylix
              (
                {pkgs, ...}: {
                  stylix.image = lib.mkIf (host.wallpaper != null) host.wallpaper;
                  stylix.base16Scheme = lib.mkIf (
                    host.base16Scheme != null
                  ) "${pkgs.base16-schemes}/share/themes/${host.base16Scheme}.yaml";
                  stylix.targets.gtk.enable = lib.mkIf host.wsl false;
                }
              )

              hostModule

              {
                home = {
                  homeDirectory = lib.mkDefault "/home/${host.user.username}";
                  sessionVariables = {
                    EDITOR = "nvim";
                  };
                  inherit (host.user) username;
                  inherit (host) stateVersion;
                };

                programs.home-manager.enable = true;
              }
            ];
          }
    );

    checks =
      config.flake.homeConfigurations
      |> lib.mapAttrsToList (
        name: hmConfig: {
          ${hmConfig.pkgs.stdenv.hostPlatform.system} = {
            "configurations:home:${name}" = hmConfig.activationPackage;
          };
        }
      )
      |> lib.mkMerge;
  };
}
