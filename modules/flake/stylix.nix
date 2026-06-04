{inputs, ...}: let
  stylix = pkgs: {
    enable = true;
    polarity = "dark";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 20;
    };

    fonts = {
      serif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "Jetbrains Mono Nerd Font Serif";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "Jetbrains Mono Nerd Font Sans Serif";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "Jetbrains Mono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
in {
  flake.modules.homeManager.stylix = {pkgs, ...}: {
    imports = [inputs.stylix.homeModules.stylix];
    # apply defaults for all hosts
    stylix =
      (stylix pkgs)
      // {
        targets.firefox = {
          profileNames = ["default"];
          colorTheme.enable = true;
        };
      };
  };
}
