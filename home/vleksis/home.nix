{ pkgs, ... }:

{
  imports = [
    ./fish/fish.nix
    ./niri/niri.nix
    ./noctalia/noctalia.nix
    ./git.nix
    ./misc.nix

    ./packages.nix
  ];

  home.username = "vleksis";
  home.homeDirectory = "/home/vleksis";

  home.stateVersion = "26.05";

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

  xdg.enable = true;
  programs.noctalia-shell.enable = true;
  programs.home-manager.enable = true;

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  xdg.mimeApps.enable = true;
}
