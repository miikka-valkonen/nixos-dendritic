{
  flake.modules.homeManager.calibre =
    { pkgs, ... }:
    {
      programs.calibre = {
        enable = true;
        package = pkgs.calibre.override { unrarSupport = true; };
      };
    };
}
