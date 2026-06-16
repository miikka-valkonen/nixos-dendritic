{config, ...}: {
  flake.modules.homeManager.spotify-player = {
    programs.spotify-player = {
      enable = true;
      settings = {
        enable_streaming = "Never";
        default_device = config.externalDevices.audioPlayer;
      };
    };
  };
}
