{ config, ... }:
{
  flake.modules.nixos.user = {
    users.users.${config.user.username}.extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
