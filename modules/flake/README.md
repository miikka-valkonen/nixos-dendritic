# Flake Infrastructure Modules

This directory contains the underlying logic that powers the flake outputs and configuration management.

## Key Files

- `flake-parts.nix`: Integration point for `flake-parts` modules.
- `nixos.nix`: Defines the `configurations.nixos` option — a lazy attrset of per-host configs with `system`, `stateVersion`, `user`, `externalDevices`, `allowUnfree`, `wsl`, `wallpaper`, `base16Scheme`, and `hostModule`. Generates `nixosConfigurations` with Nix settings (GC, `pipe-operators nix-command flakes`), networking, and optional NixOS-WSL integration.
- `home.nix`: Defines the `configurations.homeManager` option. Generates `homeConfigurations` by pulling host config from the corresponding NixOS entry. Loads secrets from `secrets/secrets.json` and passes them as `extraSpecialArgs`.
- `stylix.nix`: Declarative theming (dark polarity, JetBrains Mono Nerd Font, Bibata-Modern-Classic cursor, Noto Color Emoji). Published as a Home Manager module with Firefox color theme targets.
- `systems.nix`: Supported systems (`x86_64-linux`).

## Dendritic Pattern

The flake output is bootstrapped by passing `./modules` to `import-tree`, which recursively discovers all `.nix` files and makes them available as flake-parts modules. This logic is baked into the `home.nix` and `nixos.nix` generators so adding any `.nix` file under `modules/home/` or `modules/nixos/` immediately makes it available for import.

## How it works

1. `import-tree ./modules` reads every `.nix` file under `modules/` and returns them as a flake-parts module
2. `flake-parts` merges all discovered modules, making their `config.flake.*` outputs available
3. `nixos.nix` and `home.nix` iterate over `configurations.nixos.*` and `configurations.homeManager.*` to generate the final NixOS / Home Manager configurations
4. Both generators also produce `checks` entries so `nix flake check` builds all configurations
