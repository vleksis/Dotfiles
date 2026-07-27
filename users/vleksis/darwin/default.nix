{ pkgs, ... }:

let
  homeDirectory = "/Users/vleksis";
in
{
  users.users.vleksis = {
    home = homeDirectory;
    shell = pkgs.fish;
  };

  home-manager.users.vleksis = {
    imports = [
      ../shared
    ];

    home.homeDirectory = homeDirectory;
  };
}
