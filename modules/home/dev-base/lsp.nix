{
  flake.modules.homeManager.lsp = {pkgs, ...}: {
    home.packages = with pkgs; [
      lua-language-server
      stylua
    ];
  };
}
