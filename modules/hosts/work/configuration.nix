{config, ...}: {
  configurations.nixos.work = {
    wsl = true;
    stateVersion = "26.05";
    user = {
      username = "miikka";
      email = "miikka.valkonen@if.fi";
      uid = 1100;
    };

    base16Scheme = "kanagawa-dragon";

    hostModule.imports = with config.flake.modules.nixos; [
      user
    ];
  };
}
