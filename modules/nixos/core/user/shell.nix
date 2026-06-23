{
  flake.modules.nixos.user = {
    pkgs,
    user,
    ...
  }: {
    programs.fish.enable = true;
    programs.fish.useBabelfish = true;
    users = {
      defaultUserShell = pkgs.fish;
      users.${user.username}.shell = pkgs.fish;
    };
  };
}
