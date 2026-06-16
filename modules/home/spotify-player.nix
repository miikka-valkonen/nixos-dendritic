{
  flake.modules.homeManager.spotify-player = {config, ...}: {
    programs.spotify-player = {
      enable = true;
      settings = {
        enable_streaming = "Never";
        default_device = config.externalDevices.audioPlayer;
      };
    };
  };
}
