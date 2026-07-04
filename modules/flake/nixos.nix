{
  inputs,
  lib,
  config,
  ...
}: {
  options.configurations.nixos = lib.mkOption {
    type = lib.types.lazyAttrsOf (
      lib.types.submodule {
        options = {
          system = lib.mkOption {
            type = lib.types.singleLineStr;
            readOnly = true;
            default = "x86_64-linux";
          };
          stateVersion = lib.mkOption {
            type = lib.types.singleLineStr;
            readOnly = true;
          };
          user = {
            username = lib.mkOption {
              type = lib.types.singleLineStr;
              readOnly = true;
            };
            email = lib.mkOption {
              type = lib.types.singleLineStr;
              readOnly = true;
            };
          };

          externalDevices.audioPlayer = lib.mkOption {
            type = lib.types.singleLineStr;
            readOnly = true;
          };
          allowUnfree = lib.mkOption {
            type = lib.types.bool;
            default = true;
          };
          wsl = lib.mkOption {
            type = lib.types.bool;
            default = false;
          };

          wallpaper = lib.mkOption {
            type = lib.types.path;
          };
          base16Scheme = lib.mkOption {
            type = lib.types.nullOr (
              lib.types.enum [
                "kanagawa-dragon"
                "black-metal-mayhem"
                "framer"
              ]
            );
            default = null;
          };

          hostModule = lib.mkOption {
            type = lib.types.deferredModule;
          };
        };
      }
    );
  };

  config.flake = {
    nixosConfigurations = lib.flip lib.mapAttrs config.configurations.nixos (
      name: {
        hostModule,
        system,
        allowUnfree,
        stateVersion,
        user,
        externalDevices,
        wsl,
        ...
      }:
        lib.nixosSystem {
          specialArgs = {
            inherit user externalDevices;
          };

          modules = [
            hostModule

            {
              nixpkgs = {
                hostPlatform = system;
                config.allowUnfree = allowUnfree;
              };

              nix = {
                settings.experimental-features = "pipe-operators nix-command flakes";
                optimise.automatic = true;
                gc = {
                  automatic = true;
                  dates = "weekly";
                  options = "--delete-older-than 30d";
                };
              };

              networking.hostName = name;

              system.stateVersion = stateVersion;
            }
          ]
          ++ lib.optionals wsl [
            inputs.nixos-wsl.nixosModules.default
            { wsl.enable = true; }
          ];
        }
    );

    checks =
      config.flake.nixosConfigurations
      |> lib.mapAttrsToList (
        name: nixos: {
          ${nixos.config.nixpkgs.hostPlatform.system} = {
            "configurations:nixos:${name}" = nixos.config.system.build.toplevel;
          };
        }
      )
      |> lib.mkMerge;
  };
}
