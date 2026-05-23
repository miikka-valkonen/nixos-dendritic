{
  flake.modules.nixos.udisk =
    { pkgs, ... }:
    {
      services = {
        udisks2.enable = true;
        gvfs.enable = true;
      };

      security.polkit.enable = true;

      environment.systemPackages = with pkgs; [
        ntfs3g
        exfat
        dosfstools
      ];
    };
}
