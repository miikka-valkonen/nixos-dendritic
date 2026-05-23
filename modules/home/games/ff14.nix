{
  flake.modules.homeManager.ff14 =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        xivlauncher
      ];
    };
}
