{
  flake.modules.homeManager.nixvim = {
    programs.nixvim = {
      plugins.toggleterm = {
        enable = true;
        settings = {
          open_mapping = "[[<C-t>]]";
        };
      };

      keymaps = [
        {
          # Escape terminal mode using ESC
          mode = "t";
          key = "<esc>";
          action = "<C-\\><C-n>";
          options.desc = "Escape terminal mode";
        }
      ];
    };
  };
}
