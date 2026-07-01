{
  flake.modules.nixos.user = {user, ...}: {
    users.users = {
      root = {
        password = "change-me-now";
      };

      ${user.username} = {
        isNormalUser = true;
        description = user.username;
        password = "change-me-now";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINod4UhBmnXQ56HFrHNMTPgXmegaOfUsOOnYSqhxrzIf tech@valkonen.cc"
        ];
      };
    };
  };
}
