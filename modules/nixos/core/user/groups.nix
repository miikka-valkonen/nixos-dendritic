{
  flake.modules.nixos.user = {
    user,
    ...
  }: {
    users.users.${user.username}.extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
