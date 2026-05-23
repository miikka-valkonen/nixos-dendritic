{ config, ... }:
{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    audio
    dconf
    games
    network
    power
    udisk
    xdg
  ];
}
