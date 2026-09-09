{
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" ];

    # Keep the firmware and U-Boot installed by the official SD image. NixOS
    # generations and their extlinux configuration live on the root filesystem.
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
    fsType = "ext4";
  };

  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  swapDevices = [ ];
}
