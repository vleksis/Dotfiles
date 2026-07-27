{ pkgs, ... }:

let
  homeDirectory = "/home/vleksis";
in
{
  users.users.vleksis = {
    isNormalUser = true;
    description = "Vladislav Maltsev";
    home = homeDirectory;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  home-manager.users.vleksis = {
    imports = [
      ../shared

      ../../../modules/home-manager/nixos/desktop/applications.nix
      ../../../modules/home-manager/nixos/desktop/niri.nix
      ../../../modules/home-manager/nixos/desktop/noctalia.nix
      ../../../modules/home-manager/nixos/desktop/appearance.nix
      ../../../modules/home-manager/nixos/desktop/controls.nix
      ../../../modules/home-manager/nixos/desktop/wayland.nix
    ];

    home.homeDirectory = homeDirectory;
  };
}
