{
  flake.modules.homeManager.obsidian =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ pandoc ];

      programs.obsidian.enable = true;
    };
}
