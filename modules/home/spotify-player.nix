{
  flake.modules.homeManager.spotify-player = {
    programs.spotify-player = {
      enable = true;
      settings = {
        enable_streaming = "Never";
      }
    };
  };
}
