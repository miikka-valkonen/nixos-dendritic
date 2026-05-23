{
  flake.modules.homeManager.nixvim = {
    programs.nixvim.plugins.comment = {
      enable = true;
    };
  };
}
