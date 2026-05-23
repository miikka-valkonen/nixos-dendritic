{
  flake.modules.nixos.power = {
    services = {
      power-profiles-daemon.enable = true;

      upower = {
        enable = true;
        percentageLow = 20;
        percentageCritical = 10;
        percentageAction = 5;
        criticalPowerAction = "Hibernate";
      };

      thermald.enable = false;
    };

    powerManagement = {
      enable = true;
      cpuFreqGovernor = "powersave";
      powertop.enable = false;
    };
  };
}
