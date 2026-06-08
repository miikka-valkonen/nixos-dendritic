{config, ...}: {
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    audio
    network
    # power # look onto this later
    # udisk # look onto this later
  ];
}
