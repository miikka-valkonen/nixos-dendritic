{
  flake.modules.homeManager.nixvim = {
    programs.nixvim = {
      plugins.trouble.enable = true;

      keymaps = [
        {
          key = "<leader>d";
          action = "<CMD>Trouble diagnostics toggle<CR>";
          options.desc = "Toggle diagnostics panel";
        }
      ];
    };
  };
}
