{config, ...}: {
  configurations.homeManager.laeppaeri = {
    module = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev

        onlyoffice
        discord
        plasma-manager
      ];
    };
  };
}
