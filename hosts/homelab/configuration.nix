{ hostName, ... }:

{
  imports = [
    # The homelab profile runs on the same physical machine as the laptop.
    ../laptop/hardware-configuration.nix

    ../../modules/nixos/boot.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/users.nix

    ../../modules/homelab/services
  ];

  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  programs.fish.enable = true;

  services.fstrim.enable = true;

  system.stateVersion = "26.05";
}
