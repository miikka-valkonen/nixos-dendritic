{
  flake.modules.homeManager.cliamp = {
    pkgs,
    secrets,
    ...
  }: {
    home.packages = pkgs.lib.mkAfter [pkgs.cliamp pkgs.yt-dlp];
    home.file.".config/cliamp/config.toml".text = ''
      theme = ""
      provider = "ytmusic"
      visualizer = "Wave"

      [ytmusic]
      client_id = "${secrets.ytmusic.client_id}"
      client_secret = "${secrets.ytmusic.client_secret}"
    '';
  };
}
