{
  flake.modules.homeManager.nixvim = {
    programs.nixvim.plugins.crates = {
      enable = true;
      settings.lsp = {
        enabled = true;
        actions = true;
        completion = true;
        hover = true;
      };
    };
  };
}
