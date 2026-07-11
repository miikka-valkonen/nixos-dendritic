# Desktop Environment Modules

This directory contains modules for the graphical desktop environment. Imported as a group via the `desktop` module.

## Modules

| Module | Description |
|--------|-------------|
| `network` | NetworkManager connectivity |
| `kde` | KDE Plasma 6 with Wayland SDDM (black hole astronaut theme), Kate, KCalc, KolourPaint |

## Usage

```nix
imports = with config.flake.modules.nixos; [
  desktop
];
```
