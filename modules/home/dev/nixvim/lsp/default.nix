{
  flake.modules.homeManager.nixvim = {
    programs.nixvim = {
      plugins = {
        lsp = {
          enable = true;
          servers = {
            # Bash
            bashls.enable = true;
            # C
            clangd.enable = true;
            # Nix
            nixd.enable = true;
            statix.enable = true;
            # Lua
            lua_ls.enable = true;
            # Python
            pyright.enable = true;
            ruff.enable = true;
            # Toml
            taplo.enable = true;
            # Yaml
            yamlls.enable = true;
            # SQL
            sqls.enable = true;
            # Markdown
            marksman.enable = true;

            jdtls.enable = true;
            lemminx.enable = true;
            tflint.enable = true;

            # Packages is set to null to rely on the system wide installed packages
            # this is done to avoid conflicts with the nixpkgs versions.
            elixirls = {
              enable = true;
              package = null; # default pkgs.elixir-ls
              cmd = [ "elixir-ls" ];
            };
            gleam = {
              enable = true;
              package = null; # default pkgs.gleam
            };
            gopls = {
              enable = true;
              package = null; # default pkgs.gopls
            };
            kotlin_language_server = {
              enable = true;
              package = null; # default pkgs.kotlin-language-server
            };
            prolog_ls = {
              enable = true;
              package = null; # default pkgs.swi-prolog;
            };
          };
          keymaps = {
            silent = true;
            lspBuf = {
              gd = {
                action = "definition";
                desc = "Goto Definition";
              };
              gr = {
                action = "references";
                desc = "Goto References";
              };
              gD = {
                action = "declaration";
                desc = "Goto Declaration";
              };
              gI = {
                action = "implementation";
                desc = "Goto Implementation";
              };
              gT = {
                action = "type_definition";
                desc = "Type Definition";
              };
              K = {
                action = "hover";
                desc = "Hover";
              };
              "<leader>cw" = {
                action = "workspace_symbol";
                desc = "Workspace Symbol";
              };
              "<leader>cr" = {
                action = "rename";
                desc = "Rename";
              };
              "<leader>ca" = {
                action = "code_action";
                desc = "Code Action";
              };
              "gK" = {
                action = "signature_help";
                desc = "Signature Help";
              };
            };
            diagnostic = {
              "<leader>cd" = {
                action = "open_float";
                desc = "Line Diagnostics";
              };
              "[d" = {
                action = "goto_prev";
                desc = "Previous Diagnostic";
              };
              "]d" = {
                action = "goto_next";
                desc = "Next Diagnostic";
              };
            };
          };
        };
      };

      keymaps = [
        {
          key = "<leader>fm";
          action = "<CMD>lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
          options.desc = "Format the current buffer";
        }
        {
          key = "<leader>cl";
          action = "<CMD>lsp restart<CR>";
          options.desc = "Restart LSP";
        }
      ];
    };
  };
}
