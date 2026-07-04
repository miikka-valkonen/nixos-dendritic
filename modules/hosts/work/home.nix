{config, ...}: {
  configurations.homeManager.work = {
    module = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev-base
        dev-extra

        aerc
        spotify-player
      ];
    };
  };
}
