{config, ...}: {
  flake.modules.homeManager.git = {
    programs.git = {
      enable = true;
      settings.user = {
        name = config.user.username;
        inherit (config.user) email;
      };
      alias = {
        st = "status";
        co = "checkout";
        cob = "checkout -b";
      };
    };
  };
}
