{
  flake.modules.homeManager.git = {
    user,
    ...
  }: {
    programs.git = {
      enable = true;
      settings.user = {
        name = user.username;
        inherit (user) email;
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
