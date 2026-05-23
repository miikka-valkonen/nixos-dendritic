{
  flake.modules.homeManager.nixvim = {
    programs.nixvim = {
      plugins.lint = {
        enable = true;
        lintersByFt = {
          elixir = [ "credo" ];
          go = [ "golangcilint" ];
          kotlin = [ "ktlint" ];
          nix = [ "statix" ];
        };
      };
      autoCmd = [
        {
          event = [
            "BufWritePost"
            "BufReadPost"
            "InsertLeave"
          ];
          group = "nvim-lint";
          callback = {
            __raw = "function() require('lint').try_lint() end";
          };
        }
      ];
      autoGroups = {
        "nvim-lint" = {
          clear = true;
        };
      };
    };
  };
}
