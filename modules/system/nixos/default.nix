_:

{
  imports = [
    ../shared

    ./locale.nix
    ./networking.nix
  ];

  services.fstrim.enable = true;
}
