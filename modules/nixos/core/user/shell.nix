{config, ...}: {
  flake.modules.nixos.user = {pkgs, ...}: {
    programs.fish.enable = true;
    programs.fish.useBabelfish = true;
    users = {
      defaultUserShell = pkgs.fish;
      users.${config.user.username}.shell = pkgs.fish;
    };
  };
}
