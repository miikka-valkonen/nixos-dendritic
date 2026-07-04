{config, ...}: {
  flake.modules.homeManager.dev-base.imports = with config.flake.modules.homeManager; [
    dev-packages
    fish
    tmux
    git
    zoxide
  ];
}
