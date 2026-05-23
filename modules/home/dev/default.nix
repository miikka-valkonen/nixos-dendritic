{ config, ... }:
{
  flake.modules.homeManager.dev.imports = with config.flake.modules.homeManager; [
    nixvim
    alacritty
    antigravity
    common-packages
    direnv
    git
    zed
    zoxide
    zsh
  ];
}
