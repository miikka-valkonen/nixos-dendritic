{
  flake.modules.nixos.retroarch =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (retroarch.withCores (
          cores: with cores; [
            mame # arcade
            beetle-psx # ps1
          ]
        ))
      ];
    };
}
