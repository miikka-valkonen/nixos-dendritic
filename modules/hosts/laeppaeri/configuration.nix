{config, ...}: {
  configurations.nixos.laeppaeri = {
    stateVersion = "26.05";
    user = {
      username = "miigha";
      email = "tech@valkonen.cc";
    };
    externalDevices.audioPlayer = "Miikan WiiM Amp";

    wallpaper = ../../../wallpapers/purple_leaves.png;
    base16Scheme = "framer";

    module.imports = with config.flake.modules.nixos; [
      audio
      bluetooth
      plymouth
      openssh
      sshagent

      core

      desktop
    ];
  };
}
