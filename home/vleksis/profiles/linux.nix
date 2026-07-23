{ pkgs, ... }:

{
  imports = [
    ./shared.nix

    ../applications.nix
    ../desktop/niri.nix
    ../desktop/noctalia.nix

    ../../../modules/home/desktop/appearance.nix
    ../../../modules/home/desktop/hardware.nix
    ../../../modules/home/desktop/wayland.nix
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
