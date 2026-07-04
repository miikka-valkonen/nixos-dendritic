{config, ...}: {
  flake.modules.homeManager.dev-extra.imports = with config.flake.modules.homeManager; [
    extra-packages
  ];
}
