{
  flake.modules.homeManager.nixvim =
    { pkgs, ... }:
    {
      programs.nixvim = {
        extraPackages = with pkgs; [
          # Nix
          nixfmt
          # Rust
          rustfmt
          leptosfmt
          # Markdown
          markdownlint-cli
        ];

        plugins.conform-nvim = {
          enable = true;
          settings = {
            notify_on_error = true;
            format_on_save = {
              lspFallback = true;
              timeoutMs = 5000;
            };
            formatters_by_ft = {
              fsharp = [ "fantomas" ];
              gleam = [ "gleam" ];
              go = [
                "goimports"
                "gofmt"
              ];
              kotlin = [ "ktlint" ];
              nix = [ "nixfmt" ];
              markdown = [ "markdownlint" ];
              sh = [
                "shellharden"
                "shfmt"
              ];
              bash = [
                "shellharden"
                "shfmt"
              ];
              rust = [
                "rustfmt"
                "leptosfmt"
              ];
            };
          };
        };
      };
    };
}
