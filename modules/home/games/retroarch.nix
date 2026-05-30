{
  flake.modules.homeManager.retroarch = {
    programs.retroarch = {
      enable = true;
      cores = {
        mame.enable = true;
        beetle-psx.enable = true;
      };
    };
  };
}
