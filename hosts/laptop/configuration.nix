{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix

    ../../modules/shared

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

  nix.settings = {
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  system.stateVersion = "26.05";
}
