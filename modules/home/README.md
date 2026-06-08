# Home Manager Modules

This directory contains Home Manager modules that configure user-level applications and environments.

## Directory Structure

- `dev/`: Development tools and environments (Alacritty, Git, Zsh, Zoxide, Direnv, Zed, Nixvim, dev packages).
- `office/`: Productivity suites (Calibre, Obsidian, OnlyOffice).

## Standalone Modules

| Module | Description |
|--------|-------------|
| `discord` | Popular chat and community platform |
| `firefox` | Web browser configuration |
| `plasma-manager` | Declarative KDE Plasma configuration |

## Usage

These modules are automatically discovered and can be imported into your home configuration at `modules/hosts/<host>/home.nix` using the dendritic pattern:

```nix
imports = with config.flake.modules.homeManager; [
  dev
  firefox
  discord
  # ...
];
```
