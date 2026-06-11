{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    btop
    fastfetch
    wl-clipboard
    cliphist
    tree
    jq

    zip
    unzip
    p7zip
    unrar

    kitty
    alacritty

    fish
    eza
    mcfly

    rustup
    cargo-watch
    cargo-edit
    cargo-nextest
    gcc
    openssl

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

    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
