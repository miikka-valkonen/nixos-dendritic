{ inputs, ... }:
{
  flake.modules.homeManager.antigravity =
    { pkgs, ... }:
    {
      home.packages = [
        inputs.antigravity-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
