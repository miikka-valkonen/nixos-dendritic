{
  flake.modules.homeManager.nixvim = {
    programs.nixvim.plugins.auto-save = {
      enable = true;
      settings.enabled = true;
    };
  };
}
