{
  flake.modules.nixos.audio =
    { pkgs, ... }:
    {
      services = {
        pipewire = {
          enable = true;
          alsa = {
            enable = true;
            support32Bit = true;
          };
          pulse.enable = true;
          jack.enable = true;
        };

        pulseaudio.enable = false;
      };

      security.rtkit.enable = true;

      programs.noisetorch.enable = true;
      systemd.user.services.noisetorch-autostart = {
        description = "Noisetorch Automatic Noise Suppression";

        after = [ "pipewire-pulse.service" ];
        wants = [ "pipewire-pulse.service" ];
        wantedBy = [ "default.target" ];

        serviceConfig = {
          Type = "simple";
          RemainAfterExit = "yes";
          ExecStart = "/run/wrappers/bin/noisetorch -i && /run/wrappers/bin/noisetorch -o";
          Restart = "on-failure";
          RestartSec = 3;
        };
      };

      # HACK: temp fix for pipewire 1.6.3+
      systemd.user.services.pipewire-pulse.environment = {
        LADSPA_PATH = "/tmp:/run/current-system/sw/lib/ladspa";
      };

      environment.systemPackages = with pkgs; [
        pavucontrol
        pamixer
      ];
    };
}
