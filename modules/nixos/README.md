# NixOS Modules

This directory contains NixOS system-level modules for core services, hardware support, and desktop environments.

## Directory Structure

- `core/`: Fundamental system configuration — bootloader and locale.
- `desktop/`: Graphical environment — NetworkManager and KDE Plasma 6.
- `user/`: User account management, groups, and shell.

## Standalone Modules

| Module | Description |
|--------|-------------|
| `audio` | Pipewire audio server (ALSA + PulseAudio compatibility, rtkit) |
| `bluetooth` | Bluetooth hardware support |
| `openssh` | SSH server — key-only auth, root login disabled |
| `plymouth` | Boot splash screen |

## Usage

Modules are exposed via `config.flake.modules.nixos` and imported in `modules/hosts/<host>/configuration.nix`:

```nix
hostModule.imports = with config.flake.modules.nixos; [
  audio
  bluetooth
  plymouth
  openssh
  core
  desktop
  user
];
```
