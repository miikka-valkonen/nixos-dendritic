{
  flake.modules.homeManager.nixvim = {
    programs.nixvim = {
      plugins.nvim-tree = {
        enable = true;
        openOnSetupFile = true;
        settings = {
          auto_reload_on_write = true;
          update_focused_file.enable = true;

          git = {
            enable = true;
            ignore = false;
          };
          renderer = {
            highlight_git = true;
            icons.show.git = false;
          };

          filters.dotfiles = false;
        };
      };

      keymaps = [
        {
          key = "<C-n>";
          action = "<CMD>NvimTreeToggle<CR>";
          options.desc = "Toggle NvimTree";
        }
        {
          key = "<leader>n";
          action = "<CMD>NvimTreeToggle<CR>";
          options.desc = "Toggle NvimTree";
        }
      ];
    };
  };
}
