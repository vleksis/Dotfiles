{ config, pkgs, ... }:

{
  config.fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji

    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.symbols-only

    material-design-icons
    font-awesome
  ];
}
