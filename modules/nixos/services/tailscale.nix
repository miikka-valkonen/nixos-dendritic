{
  flake.modules.nixos.tailscale =
    { config, pkgs, ... }:
    {
      services = {
        tailscale = {
          enable = true;
          openFirewall = true;
          extraUpFlags = [ "--accept-dns=true" ];
        };
        resolved = {
          enable = true;
          settings.Resolve.DNSSEC = false;
        };
      };

      networking = {
        nftables.enable = true;
        firewall = {
          checkReversePath = "loose";
          trustedInterfaces = [ "tailscale0" ];
          allowedUDPPorts = [ config.services.tailscale.port ];
        };
      };

      systemd.services.tailscaled.serviceConfig.Environment = [
        "TS_DEBUG_FIREWALL_MODE=nftables"
      ];
      systemd.network.wait-online.enable = false;
      boot.initrd.systemd.network.wait-online.enable = false;

      environment.systemPackages = [ pkgs.tailscale ];
    };
}
