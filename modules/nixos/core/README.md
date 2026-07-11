# Core System Modules

This directory contains fundamental NixOS system-level modules for boot and locale. Imported as a group via the `core` module.

## Modules

| Module | Description |
|--------|-------------|
| `boot` | systemd-boot bootloader with EFI support |
| `locale` | Europe/Helsinki timezone, Finnish locale overrides, Finnish keyboard layout |

## Usage

```nix
imports = with config.flake.modules.nixos; [ core ];
```
