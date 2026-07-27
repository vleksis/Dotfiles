{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    playerctl
    pamixer
    pavucontrol
    pwvucontrol
  ];
}
