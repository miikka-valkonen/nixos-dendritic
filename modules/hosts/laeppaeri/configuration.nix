{config, ...}: {
  configurations.nixos.laeppaeri = {
    stateVersion = "26.05";
    base16Scheme = "framer";

    module.imports = with config.flake.modules.nixos; [
      bluetooth
      plymouth
      podman

      # CORE
      core

      # DESKTOP
      desktop
      kde

      # SERVICES
      tailscale
    ];
  };
}
