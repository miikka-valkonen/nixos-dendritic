{config, ...}: {
  flake.modules.homeManager.dev.imports = with config.flake.modules.homeManager; [
    common-packages
    fish
    tmux
    git
    zoxide
  ];
}
