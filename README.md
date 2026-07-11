# nixos-dendritic

[![NixOS](https://img.shields.io/badge/NixOS-unstable-blue?logo=nixos&logoColor=white)](https://nixos.org)
[![flake-parts](https://img.shields.io/badge/built%20with-flake--parts-7a4c9d)](https://github.com/hercules-ci/flake-parts)

Miigha's personal NixOS configuration using a **dendritic** (tree-based) module discovery pattern built on top of [flake-parts](https://github.com/hercules-ci/flake-parts) and [import-tree](https://github.com/vic/import-tree).

Modules placed anywhere under `modules/` are automatically discovered and made available — no manual import lists needed.

## Hosts

| Host | Type | Hardware | Desktop | Notes |
|------|------|----------|---------|-------|
| `laeppaeri` | Laptop | Intel CPU/iGPU, Nvidia 960MX (disabled) | KDE Plasma 6 | Audio, Bluetooth, Plymouth |
| `work` | WSL | — | — | NixOS-WSL, work tooling only |

## Features

- **Dendritic module discovery** — drop a `.nix` file anywhere in `modules/` and it's automatically imported
- **Per-host configuration** — separate `configuration.nix` + `home.nix` per machine
- **Declarative theming** via [Stylix](https://github.com/danth/stylix) — dark theme, JetBrains Mono Nerd Font, Bibata-Modern-Classic cursor, Firefox theme targets
- **Home Manager** — user-level package and dotfile management for every host
- **KDE Plasma 6** — declarative desktop via [plasma-manager](https://github.com/nix-community/plasma-manager) with custom SDDM (black hole theme)
- **WSL support** — `work` host runs under NixOS-WSL with minimal footprint
- **Secrets** — loaded from `secrets/secrets.json` (encrypted with git-crypt)
- **Dev tooling** — neovim, lazygit, opencode, claude-code, rtk, fish, tmux, zoxide, fzf, ripgrep
- **Work tooling** — .NET SDK (8/9/10), Azure CLI, Terraform, bicep, Bruno CLI
- **Email** — aerc with Gmail and privateemail.com accounts
- **Music** — cliamp with YouTube Music

## Structure

```
modules/
├── flake/              # Flake-level outputs (flake-parts wiring, theming, systems)
│   ├── flake-parts.nix # flake-parts integration
│   ├── home.nix        # Home Manager output generator
│   ├── nixos.nix       # NixOS configuration generator
│   ├── stylix.nix      # Declarative theming (JetBrains Mono, Bibata cursor)
│   └── systems.nix     # Supported systems (x86_64-linux, aarch64-linux)
├── hosts/              # Per-host machine configurations
│   ├── laeppaeri/      # Laptop: configuration.nix, home.nix, hardware-configuration.nix
│   └── work/           # WSL: configuration.nix, home.nix
├── nixos/              # Shared NixOS system modules
│   ├── core/           # Boot, locale
│   ├── desktop/        # NetworkManager + KDE Plasma 6
│   ├── user/           # User accounts, groups, shell
│   ├── audio.nix       # Pipewire audio
│   ├── bluetooth.nix   # Bluetooth support
│   ├── openssh.nix     # SSH server (key-only auth)
│   └── plymouth.nix    # Boot splash screen
└── home/               # Home Manager user modules
    ├── dev-base/       # Core dev tools (fish, tmux, git, zoxide, neovim, etc.)
    ├── dev-extra/      # Work dev tools (.NET, Azure, Terraform, Bruno)
    ├── aerc.nix        # Terminal email client
    ├── cliamp.nix      # CLI music player (YouTube Music)
    ├── discord.nix
    ├── firefox.nix
    ├── kitty.nix       # Terminal emulator
    ├── onlyoffice.nix
    └── plasma-manager.nix

secrets/
    secrets.json        # Encrypted with git-crypt

wallpapers/
    purple_leaves.png
```

## Prerequisites

- NixOS with flakes enabled
- `experimental-features = nix-command flakes` (already default on NixOS)

## Usage

### Apply system configuration

```bash
sudo nixos-rebuild switch --flake .#<host>
```

### Apply Home Manager only

```bash
home-manager switch --flake .#<host>
```

### Update flake inputs

```bash
nix flake update
```

### Check flake integrity

```bash
nix flake check
```

## Adding a new host

1. Create a directory under `modules/hosts/<name>/`
2. Add `configuration.nix` and `home.nix` following the pattern of existing hosts
3. The dendritic architecture automatically discovers the new host — no registration needed

## Adding a new module

Create a `.nix` file anywhere under `modules/` and it will be automatically available via `config.flake.modules.nixos.<name>` (for `modules/nixos/`) or `config.flake.modules.homeManager.<name>` (for `modules/home/`).
