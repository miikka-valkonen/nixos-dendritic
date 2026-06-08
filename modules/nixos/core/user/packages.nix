{config, ...}: {
  flake.modules.nixos.user = {pkgs, ...}: {
    users.users.${config.user.username}.packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
