{config, ...}: {
  configurations.nixos.work = {
    wsl = true;
    stateVersion = "26.05";
    user = {
      username = "miikka";
      email = "miikka.valkonen@if.fi";
    };
    externalDevices.audioPlayer = "Miikan WiiM Amp";

    base16Scheme = "kanagawa-dragon";

    hostModule.imports = with config.flake.modules.nixos; [
      user
    ];
  };
}
