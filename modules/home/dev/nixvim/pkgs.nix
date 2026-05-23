{
  flake.modules.homeManager.nixvim =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # Rust
        cargo
        rustc
        rustfmt

        # Go
        go

        # Nix
        nil
        nixd

        # Tools
        ripgrep
      ];
    };
}
