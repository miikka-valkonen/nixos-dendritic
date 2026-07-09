{
  flake.modules.homeManager.extra-packages = {pkgs, ...}: let
    combinedDotnet = with pkgs.dotnetCorePackages;
      combinePackages [
        sdk_8_0
        sdk_9_0
        sdk_10_0
      ];
  in {
    home.packages = with pkgs; [
      combinedDotnet
      bicep
      sqlcmd # enable dadbod
      pup # pretty print ADO XML fields in Nvim
      markdownlint-cli2
      bruno-cli
      azure-cli
      azure-cli-extensions.azure-devops
      terraform
    ];

    home.sessionVariables = {
      DOTNET_ROOT = "${combinedDotnet}/share/dotnet";
    };
  };
}
