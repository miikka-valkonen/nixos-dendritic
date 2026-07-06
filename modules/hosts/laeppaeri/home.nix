{config, ...}: {
  configurations.homeManager.laeppaeri = {
    hostModule = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev-base

        discord
        firefox
        onlyoffice
        plasma-manager
        aerc
        kitty
        cliamp
      ];
    };
  };
}
