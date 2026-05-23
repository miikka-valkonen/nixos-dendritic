{
  flake.modules.nixos.games = {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;

        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };

      gamescope.enable = true;
      gamemode.enable = true;
    };
  };
}
