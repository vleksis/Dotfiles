{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty

    telegram-desktop

    nautilus
    file-roller
    unrar

    loupe
    mpv
  ];
}
