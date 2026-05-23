{
  flake.modules.nixos.gnome =
    { pkgs, ... }:
    {
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
      programs.dconf.enable = true;

      environment.systemPackages = with pkgs; [
        gnome-tweaks
        gnome-extension-manager
      ];
    };
}
