{ pkgs, ... }:

{
  home.packages = with pkgs; [
    adwaita-icon-theme
    hicolor-icon-theme
    capitaine-cursors
    shared-mime-info
    desktop-file-utils
  ];
}
