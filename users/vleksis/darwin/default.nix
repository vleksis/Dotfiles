{ pkgs, ... }:

let
  homeDirectory = "/Users/vleksis";
in
{
  imports = [ ./screenshots.nix ];

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
