{ pkgs, ... }:

{
  home.packages = with pkgs; [
    adwaita-icon-theme
    hicolor-icon-theme
    capitaine-cursors
    shared-mime-info
    desktop-file-utils
  ];

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
