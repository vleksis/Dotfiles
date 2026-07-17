{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = 6;

  programs.fish.enable = true;

  environment.shells = [
    pkgs.fish
  ];

  users.users.vleksis = {
    home = "/Users/vleksis";
    shell = pkgs.fish;
  };
}
