{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty

    telegram-desktop
    zed-editor

    nautilus
    file-roller
    unrar

    loupe
    mpv
  ];
}
