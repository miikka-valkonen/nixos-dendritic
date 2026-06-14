{config, ...}: {
  flake.modules.homeManager.dev-base.imports = with config.flake.modules.homeManager; [
    common-packages
    fish
    tmux
    git
  ];
}
