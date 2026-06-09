{config, ...}: {
  configurations.nixos.laeppaeri = {
    stateVersion = "26.05";
    wallpaper = ../../../wallpapers/purple_leaves.png;
    base16Scheme = "framer";

    module.imports = with config.flake.modules.nixos; [
      audio
      bluetooth
      plymouth

      core

      # DESKTOP
      desktop
    ];
  };
}
