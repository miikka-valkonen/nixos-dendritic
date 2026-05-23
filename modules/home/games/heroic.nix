{
  flake.modules.homeManager.heroic =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        (heroic.override {
          extraPkgs =
            pkgs': with pkgs'; [
              gamescope
              gamemode
            ];
        })
      ];
    };
}
