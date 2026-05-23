{
  flake.modules.homeManager.nixvim = {
    programs.nixvim = {
      plugins.bufdelete.enable = true;
      keymaps = [
        {
          mode = "n";
          key = "<leader>bd";
          action = "<CMD>Bdelete<CR>";
          options = {
            desc = "Delete Buffer";
          };
        }
        {
          mode = "n";
          key = "<leader>bw";
          action = "<CMD>Bwipeout<CR>";
          options = {
            desc = "Wipe Buffers";
          };
        }
      ];
    };
  };
}
