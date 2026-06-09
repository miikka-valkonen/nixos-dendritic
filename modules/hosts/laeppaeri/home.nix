{config, ...}: {
  configurations.homeManager.laeppaeri = {
    module = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev

        discord
        firefox
        onlyoffice
        plasma-manager
      ];
    };
  };
}
