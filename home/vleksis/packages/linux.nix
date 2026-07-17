{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    unrar

    kitty
    alacritty

    telegram-desktop

    awww
    swayidle
    grim
    slurp
    swappy
    wf-recorder

    brightnessctl
    playerctl
    pamixer
    pavucontrol
    pwvucontrol

    zed-editor

    nautilus
    file-roller
    loupe
    mpv

    fuzzel
    xwayland-satellite

    papirus-icon-theme
    adwaita-icon-theme
    hicolor-icon-theme
    capitaine-cursors
    shared-mime-info
    desktop-file-utils
  ];
}
