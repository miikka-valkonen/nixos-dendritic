{
  flake.modules.nixos.kde = {pkgs, ...}: let
    custom-sddm = pkgs.sddm-astronaut.override {
      embeddedTheme = "black_hole";
    };
  in {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
        theme = "sddm-astronaut-theme";
        extraPackages = [custom-sddm];
      };
      xserver.enable = true;
    };

    environment.systemPackages = with pkgs; [
      custom-sddm

      kdePackages.kcalc # Calculator
      kdePackages.kolourpaint # Simple paint program
      kdePackages.ksystemlog # System log viewer
      kdePackages.sddm-kcm # SDDM configuration module
      kdePackages.plasma-browser-integration # Browser integration
    ];
  };
}
