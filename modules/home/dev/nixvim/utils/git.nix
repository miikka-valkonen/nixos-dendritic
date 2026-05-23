{
  flake.modules.homeManager.nixvim =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ lazygit ];

      programs.nixvim = {
        plugins = {
          lazygit.enable = true;

          gitsigns = {
            enable = true;
            settings = {
              current_line_blame = true;
              trouble = true;
            };
          };
        };

        keymaps = [
          # Git – Hunk Navigation
          {
            key = "]h";
            action = "<CMD>Gitsigns next_hunk<CR>";
            options.desc = "Next git hunk";
          }
          {
            key = "[h";
            action = "<CMD>Gitsigns prev_hunk<CR>";
            options.desc = "Previous git hunk";
          }

          # Git
          {
            mode = "n";
            key = "<leader>g";
            action = "+git";
          }

          {
            key = "<leader>gd";
            action = "<CMD>Gitsigns diffthis<CR>";
            options.desc = "Gitsigns diff this buffer";
          }

          ## LazyGit
          {
            mode = "n";
            key = "<leader>gl";
            action = "<cmd>LazyGit<CR>";
            options = {
              desc = "LazyGit";
            };
          }

          ## Staging
          {
            key = "<leader>gs";
            action = "<CMD>Gitsigns stage_hunk<CR>";
            options.desc = "Stage hunk";
          }
          {
            key = "<leader>gS";
            action = "<CMD>Gitsigns stage_buffer<CR>";
            options.desc = "Stage buffer";
          }
          {
            key = "<leader>gu";
            action = "<CMD>Gitsigns undo_stage_hunk<CR>";
            options.desc = "Undo stage hunk";
          }

          ## Toggles
          {
            mode = "n";
            key = "<leader>gt";
            action = "+toggles";
          }
          {
            key = "<leader>gtb";
            action = "<CMD>Gitsigns toggle_current_line_blame<CR>";
            options.desc = "Gitsigns current line blame";
          }
          {
            key = "<leader>gtd";
            action = "<CMD>Gitsigns toggle_deleted<CR>";
            options.desc = "Gitsigns deleted";
          }

          ## Resets
          {
            mode = "n";
            key = "<leader>gr";
            action = "+resets";
          }
          {
            key = "<leader>grh";
            action = "<CMD>Gitsigns reset_hunk<CR>";
            options.desc = "Gitsigns reset hunk";
          }
          {
            key = "<leader>grb";
            action = "<CMD>Gitsigns reset_buffer<CR>";
            options.desc = "Gitsigns reset current buffer";
          }
        ];
      };
    };
}
