{
  flake.modules.homeManager.bottles =
    { pkgs, ... }:
    {
      # HACK: disable check of openldap to enable bottles compilation
      nixpkgs.overlays = [
        (final: prev: {
          openldap = prev.openldap.overrideAttrs (oldAttrs: {
            doCheck = false;
          });
        })
      ];

      home.packages = with pkgs; [
        (bottles.override { removeWarningPopup = true; })
      ];
    };
}
