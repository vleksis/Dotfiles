{ ... }:

{
  imports = [
    ./shared.nix
  ];

  home.homeDirectory = "/Users/vleksis";

  programs.man.generateCaches = false;
}
