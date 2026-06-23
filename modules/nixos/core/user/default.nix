{
  flake.modules.nixos.user = {
    user,
    ...
  }: {
    users.users = {
      root = {
        password = "change-me-now";
      };

      ${user.username} = {
        isNormalUser = true;
        description = user.username;
        password = "change-me-now";
      };
    };
  };
}
