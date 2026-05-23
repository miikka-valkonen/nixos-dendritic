{ config, ... }:
{
  flake.modules.nixos.user = {
    users.users = {
      root = {
        isSystemUser = true;
        hashedPassword = config.rootHashedPassword;
      };

      ${config.user.username} = {
        isNormalUser = true;
        description = config.user.username;
        inherit (config.user) hashedPassword;
      };
    };
  };
}
