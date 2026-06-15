{
  flake.modules.homeManager.common-packages = {pkgs, ...}: {
    home.packages = with pkgs; [
      neovim
      unzip
      fzf
      ripgrep
      fd
      g-ls
      tmuxinator
      delta
      cargo
      rustc
      fastfetch
      gcc
      jq
      luajitPackages.luarocks_bootstrap
      lazygit
      nix-search-cli
      gnumake
      nodejs_26
      opencode
      rtk
    ];
  };
}
