{config, ...}: {
  configurations.nixos.work = {
    wsl = true;
    stateVersion = "26.05";
    user = {
      username = "miikka";
      name = "Miikka Valkonen";
      email = "miikka.valkonen@if.fi";
      uid = 1100;
    };

    base16Scheme = "black-metal-mayhem";

    hostModule.imports = with config.flake.modules.nixos; [
      user
    ];
  };
}
