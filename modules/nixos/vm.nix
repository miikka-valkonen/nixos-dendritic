{ config, ... }:
{
  flake.modules.nixos.vm = {
    programs.virt-manager.enable = true;

    virtualisation = {
      libvirtd.enable = true;

      virtualbox = {
        host = {
          enable = true;
          enableExtensionPack = true;
        };

        guest = {
          enable = true;
          clipboard = true;
          dragAndDrop = true;
        };
      };

      spiceUSBRedirection.enable = true;
    };

    users.users.${config.user.username}.extraGroups = [
      "libvirtd"
      "vboxusers"
    ];
  };
}
