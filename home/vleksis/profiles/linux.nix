{ pkgs, ... }:

{
  imports = [
    ./shared.nix

    ../modules/desktop/appearance.nix
    ../modules/desktop/applications.nix
    ../modules/desktop/hardware.nix
    ../modules/desktop/niri.nix
    ../modules/desktop/noctalia.nix
    ../modules/desktop/wayland.nix
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
