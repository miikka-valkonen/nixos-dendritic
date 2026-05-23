{
  flake.modules.homeManager.nixvim = {
    programs.nixvim.plugins.render-markdown = {
      enable = true;
    };
  };
}
