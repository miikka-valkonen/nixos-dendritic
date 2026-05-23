# Default shell for the user across NixOS and Android
{ config, ... }:
{
  flake.modules.nixos.user =
    { pkgs, ... }:
    {
      programs.zsh.enable = true;
      users = {
        defaultUserShell = pkgs.zsh;
        users.${config.user.username}.shell = pkgs.zsh;
      };
    };
}
