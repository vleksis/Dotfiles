{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./niri
    ./noctalia.nix
    ./packages.nix
  ];

  home.homeDirectory = "/home/vleksis";

  xdg.enable = true;

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  xdg.mimeApps.enable = true;
}
