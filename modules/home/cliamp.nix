{
  flake.modules.homeManager.cliamp = {pkgs, ...}: {
    home.packages = pkgs.lib.mkAfter [pkgs.cliamp pkgs.yt-dlp];
  };
}
