{config, ...}: {
  configurations.homeManager.work = {
    hostModule = {pkgs, ...}: {
      imports = with config.flake.modules.homeManager; [
        dev-base
        dev-extra

        aerc
        cliamp
      ];
    };
  };
}
