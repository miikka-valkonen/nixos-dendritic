{config, ...}: {
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    network
    kde
    # power # look onto this later
    # udisk # look onto this later
  ];
}
