{
  flake.modules.homeManager.spotify-player = {
    externalDevices,
    ...
  }: {
    programs.spotify-player = {
      enable = true;
      settings = {
        enable_streaming = "Never";
        default_device = externalDevices.audioPlayer;
      };
    };
  };
}
