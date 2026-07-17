{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
