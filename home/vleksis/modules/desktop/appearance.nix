{ pkgs, ... }:

{
  home.packages = with pkgs; [
    papirus-icon-theme
    adwaita-icon-theme
    hicolor-icon-theme
    capitaine-cursors
    shared-mime-info
    desktop-file-utils
  ];
}
