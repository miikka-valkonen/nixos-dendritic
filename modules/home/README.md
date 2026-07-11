# Home Manager Modules

This directory contains Home Manager modules that configure user-level applications and environments.

## Module Groups

- `dev-base/`: Core developer tools — fish shell (with abbreviations), tmux, git, zoxide, and packages: neovim, lazygit, fzf, ripgrep, fd, delta, cargo/rustc, gcc, jq, luarocks, tmuxinator, fastfetch, nodejs, opencode, claude-code, rtk, git-crypt.
- `dev-extra/`: Work-specific tools — .NET SDK (8/9/10), Azure CLI, Terraform, bicep, sqlcmd, pup, markdownlint-cli2, Bruno CLI; also git-hooks.

## Standalone Modules

| Module | Description |
|--------|-------------|
| `aerc` | Terminal email client with Gmail and privateemail.com accounts |
| `cliamp` | CLI music player using YouTube Music |
| `discord` | Discord desktop client |
| `firefox` | Firefox with Stylix color theme |
| `kitty` | Kitty terminal emulator |
| `onlyoffice` | OnlyOffice office suite |
| `plasma-manager` | Declarative KDE Plasma configuration |

## Usage

Modules are automatically discovered and imported in `modules/hosts/<host>/home.nix`:

```nix
hostModule = {pkgs, ...}: {
  imports = with config.flake.modules.homeManager; [
    dev-base
    discord
    firefox
    plasma-manager
    aerc
    kitty
    cliamp
  ];
};
```
