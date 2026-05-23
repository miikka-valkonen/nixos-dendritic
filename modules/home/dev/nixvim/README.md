# Nixvim Configuration

This is a comprehensive, modular Neovim configuration built using [Nixvim](https://github.com/nix-community/nixvim). It prioritizes speed, developer ergonomics, and a polished UI.

## Features

- **Language Server Protocol (LSP)**: Integrated support for multiple languages with automated formatting (Conform) and linting (nvim-lint).
- **Modern UI**: Powered by `Noice.nvim`, `Lualine`, `Bufferline`, and `Which-key` for a clean, informative interface.
- **Deep Git Integration**: `Gitsigns` for gutter indicators and hunk management, plus `LazyGit` integration.
- **Smart Search**: `Telescope` for fuzzy finding files, symbols, diagnostics, and git history.
- **Treesitter**: Advanced syntax highlighting and code context (Sticky headers).
- **Productivity Utils**: Auto-pairs, surrounding management (`nvim-surround`), auto-save, and easy commenting.

## Configuration Structure

The configuration is organized into logical modules:

- `default.nix`: Main entry point and imports.
- `lsp/`: LSP server configs, `conform` (formatting), `lint` (linting), and `trouble` (diagnostics list).
- `ui/`: User interface components (`lualine`, `bufferline`, `noice`, `which-key`).
- `utils/`: Productivity plugins and tools (`telescope`, `git`, `opencode`, `toggleterm`, `nvim-tree`).
- `cmp.nix`: Autocompletion engine (`nvim-cmp`) and snippets.
- `keymaps.nix`: General window and buffer navigation keybindings.
- `pkgs.nix`: System packages required by various plugins.

---

# Keymap Cheatsheet

> **Leader key**: `<Space>`

## Window Navigation & Resizing

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | n, t | Move to Left / Down / Up / Right window |
| `<C-Up>` / `<C-Down>` | n | Increase / Decrease window height |
| `<C-Left>` / `<C-Right>` | n | Decrease / Increase window width |

## Buffers & Tabs

| Key | Mode | Action |
|-----|------|--------|
| `<S-h>` / `<S-l>` | n | Previous / Next buffer |
| `<leader>bn` | n | Previous buffer |
| `<leader>bb` | n | Switch to last buffer |
| `<leader>bd` | n | Delete current buffer |
| `<leader>bw` | n | Wipe current buffer |
| `<leader>tn` / `<leader>td` | n | New tab / Close tab |
| `<leader>th` / `<leader>tl` | n | Previous / Next tab |
| `<C-n>` / `<leader>n` | n | Toggle file tree (NvimTree) |

## Editing & Movement

| Key | Mode | Action |
|-----|------|--------|
| `<C-d>` / `<C-u>` | n | Scroll half-page Down / Up (cursor centered) |
| `n` / `N` | n | Next / Prev search result (cursor centered) |
| `J` / `K` | v | Move selected block Down / Up |
| `<esc>` | n | Escape and clear search highlights |
| `<C-s>` | n | Save |
| `<leader>q` | n | Quit |
| `<leader>Q` | n | Quit all windows |

## LSP

| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Go to Definition |
| `gD` | n | Declaration |
| `gr` | n | Go to References |
| `gI` | n | Implementation |
| `gT` | n | Type Definition |
| `K` / `gK` | n | Hover docs / Signature help |
| `<leader>cr` | n | Rename symbol |
| `<leader>ca` | n | Code Action |
| `<leader>cw` | n | Workspace symbol search |
| `<leader>fm` | n | Format buffer (conform) |
| `<leader>cl` | n | Restart LSP client |

## Diagnostics

| Key | Mode | Action |
|-----|------|--------|
| `[d` / `]d` | n | Previous / Next diagnostic |
| `<leader>cd` | n | Show line diagnostics (float) |
| `<leader>d` | n | Toggle diagnostics panel |
| `<leader>sd` | n | Document |
| `<leader>sD` | n | Workspace diagnostics |

## Telescope — Search & Find

| Key | Mode | Action |
|-----|------|--------|
| `<leader><space>` / `<leader>ff` | n | Find project files |
| `<leader>/` / `<leader>fg` | n | Live grep |
| `<C-p>` | n | Git files |
| `<leader>sa` | n | Auto commands |
| `<leader>sb` | n | Fuzzy buffer |
| `<leader>sc` | n | Command history |
| `<leader>sC` | n | Commands |
| `<leader>sh` | n | Help tags |
| `<leader>sH` | n | Highlight groups |
| `<leader>sk` | n | Keymaps |
| `<leader>sm` | n | Marks |
| `<leader>sM` | n | Man pages |
| `<leader>so` | n | Vim options |
| `<leader>sr` | n | Resume picker |
| `<leader>st` | n | Todo comments |
| `<leader>su` | n | Undo history |

## Git

| Key | Mode | Action |
|-----|------|--------|
| `[h` / `]h` | n | Previous / Next git hunk |
| `<leader>gl` | n | Open LazyGit |
| `<leader>gc` | n | Telescope: commits |
| `<leader>gv` | n | Telescope: Git status view |
| `<leader>gd` | n | Gitsigns: diff this buffer |
| `<leader>gs` / `<leader>gS` | n | Stage hunk / Stage buffer |
| `<leader>gu` | n | Undo stage hunk |
| `<leader>gtb` | n | Toggle: line blame |
| `<leader>gtd` | n | Toggle: deleted lines |
| `<leader>grh` | n | Reset hunk |
| `<leader>grb` | n | Reset buffer |

## Opencode

| Key | Mode | Action |
|-----|------|--------|
| `<C-a>` | n, x | Ask Opencode with `@this` |
| `<C-x>` | n, x | Execute Opencode action |
| `<C-.>` | n, t | Toggle Opencode panel |
| `go` | n, x | Add range to Opencode |
| `goo` | n | Add line to Opencode |
| `<S-C-u>` | n | Scroll Opencode panel up |
| `<S-C-d>` | n | Scroll Opencode panel down |
| `+` | n | Increment number under cursor |
| `-` | n | Decrement number under cursor |

## Utilities

| Key | Mode | Action |
|-----|------|--------|
| `gcc` / `gc` | n / v | Toggle comment (line / block) |
| `ys` / `cs` / `ds` | n | Add / Change / Delete surroundings |
| `<leader>co` | n | Toggle Treesitter context |
| `<C-t>` | n, t | Toggle terminal |
| `<esc>` | t | Exit terminal mode |

## Completion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<C-n>` / `<C-j>` | i | Next completion item |
| `<C-p>` / `<C-k>` | i | Previous completion item |
| `<Tab>` / `<S-Tab>` | i | Confirm / Close completion |
| `<C-Space>` | i | Trigger completion |
| `<C-d>` / `<C-f>` | i | Scroll docs down / up |
| `<Down>` / `<Up>` | i | Expand / Jump snippet |
