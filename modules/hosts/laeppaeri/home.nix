{config, ...}: {
  configurations.homeManager.laeppaeri = {
    module = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev-base

        discord
        firefox
        onlyoffice
        plasma-manager
        aerc
        kitty
        spotify
        spotify-player
      ];
    };
  };
}
