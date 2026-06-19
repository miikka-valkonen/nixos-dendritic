{ config, ... }:
let
  username = config.user.username;
in {
  flake.modules.nixos.user = { config, ... }: {
    users.users = {
      root = {
        isSystemUser = true;
        hashedPasswordFile = config.age.secrets.root.path;
      };

      ${username} = {
        isNormalUser = true;
        description = username;
        hashedPasswordFile = config.age.secrets.user.path;
      };
    };
  };
}
