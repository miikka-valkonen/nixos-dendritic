{ config, ... }:
{
  flake.modules.nixos.user = {
    users.users = {
      root = {
        password = "change-me-now";
      };

      ${config.user.username} = {
        isNormalUser = true;
        description = config.user.username;
        password = "change-me-now";
      };
    };
  };
}
