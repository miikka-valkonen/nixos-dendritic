{
  flake.modules.homeManager.spotify = {pkgs, ...}: {
      home.packages = pkgs.lib.mkAfter [ pkgs.spotify ];
  };
}
