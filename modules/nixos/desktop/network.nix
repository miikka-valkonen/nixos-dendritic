{
  flake.modules.nixos.network =
    { pkgs, ... }:
    {
      networking.networkmanager.enable = true;
      services.vnstat.enable = true;
      environment.systemPackages = with pkgs; [ python313Packages.dbus-python ];
    };
}
