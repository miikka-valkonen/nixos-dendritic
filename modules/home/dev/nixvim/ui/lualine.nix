{
  flake.modules.homeManager.nixvim = {
    programs.nixvim.plugins.lualine = {
      enable = true;
      settings = {
        options.theme = "auto";
      };
    };
  };
}
