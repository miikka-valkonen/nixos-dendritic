{ config, ... }:
{
  configurations.homeManager.dean = {
    module =
      { pkgs, ... }:
      {
        imports = with config.flake.modules.homeManager; [
          bottles
          discord
          gtk
          librewolf
          plasma-manager
          udiskie

          # DEV
          dev

          # GAMES
          lutris

          # OFFICE
          obsidian
          onlyoffice
        ];

        home.packages = with pkgs; [
          winboat # windows as a container
        ];
      };
  };
}
