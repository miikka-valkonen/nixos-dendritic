{ config, ... }:
{
  configurations.nixos.sam = {
    # Sytem optinos
    stateVersion = "26.05";
    wallpaper = ../../../wallpapers/cat.png;
    base16Scheme = "gruvbox-dark-hard";

    # Modules
    module =
      { ... }:
      {
        imports = with config.flake.modules.nixos; [
          bluetooth
          docker
          plymouth
          podman
          wacom

          # CORE
          core

          # DESKTOP
          desktop
          kde

          # SERVICES
          tailscale
          ollama
        ];

        config = {
        };
      };
  };
}
