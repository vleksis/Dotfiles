{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    helix
    git
    alacritty
    fuzzel
    wl-clipboard
    xwayland-satellite
    zip
    unzip
    gzip
  ];
}
