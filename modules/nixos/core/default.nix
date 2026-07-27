_:

{
  imports = [
    ../../shared

    ./locale.nix
    ./networking.nix
    ./nix.nix
  ];

  programs.fish.enable = true;

  services.fstrim.enable = true;
}
