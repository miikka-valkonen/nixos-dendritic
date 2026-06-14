{config, ...}: {
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings.user = {
        name = config.user.username;
        inherit (config.user) email;
      };
      settings.alias = {
        st = "status";
        co = "checkout";
        cob = "checkout -b";
        com = "checkout main";
      };
    };
  };
}
