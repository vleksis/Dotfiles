{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix

    ../../modules/nixos/boot.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/hardware.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/sound.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/ld.nix
  ];

  system.stateVersion = "26.05";
}
