{ ... }:

{
  imports = [
    ./fish.nix
    ./git.nix
    ./misc.nix
  ];

  home.username = "vleksis";
  home.stateVersion = "26.05";

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

  programs.home-manager.enable = true;
}
