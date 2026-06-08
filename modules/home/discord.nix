{
  flake.modules.homeManager.discord = {
    programs.vesktop = {
      enable = true;

      vencord.settings = {
        autoUpdate = true;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;
        disableMinSize = true;
        plugins = {
          FakeNitro.enabled = true;
          clearURLs.enabled = true;
        };
      };
    };
  };
}
