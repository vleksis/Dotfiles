{ ... }:

{
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    useOSProber = true;

    extraEntries = ''
      menuentry "CachyOS (Limine)" {
        insmod part_gpt
        insmod fat
        search --no-floppy --fs-uuid --set=esp F585-4E9E
        chainloader ($esp)/EFI/limine/limine_x64.efi
      }
    '';
  };

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };
}
