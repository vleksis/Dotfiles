_:

{
  imports = [
    ../../shared

    ../boot.nix
    ../locale.nix
    ../nix.nix
    ../users.nix

    ../../homelab/services
  ];

  networking.networkmanager.enable = true;

  programs.fish.enable = true;

  services.fstrim.enable = true;

  system.stateVersion = "26.05";
}
