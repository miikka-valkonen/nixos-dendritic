{config, ...}: {
  configurations.homeManager.work = {
    module = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev-base

        aerc
        spotify-player
      ];
    };
  };
}
