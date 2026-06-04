# NixOS Modules

This directory contains NixOS system-level modules for core services, hardware support, and desktop environments.

## Directory Structure

- `core/`: Fundamental system configuration — bootloader, locale, SSH, user accounts.
- `desktop/`: Graphical environment, audio, networking, power, gaming, and desktop managers.
- `services/`: System services — Tailscale mesh VPN, Ollama LLM server.

## Standalone Modules

| Module | Description |
|--------|-------------|
| `bluetooth` | Enable and configure Bluetooth hardware |
| `plymouth` | Boot splash screen configuration |

## Usage

Modules are automatically exposed via `config.flake.modules.nixos` and can be imported in `modules/hosts/<host>/configuration.nix`:

```nix
module.imports = with config.flake.modules.nixos; [
  core
  desktop
  kde
  bluetooth
  # ...
];
```
