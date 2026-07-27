_:

{
  imports = [
    ../shared

    ./locale.nix
    ./networking.nix
  ];

  programs.fish.generateCompletions = false;

  services.fstrim.enable = true;
}
