{ pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    fzf
  ];

  home.homeDirectory = "/Users/vleksis";
  home.sessionPath = [
    "/etc/profiles/per-user/vleksis/bin"
    "/run/current-system/sw/bin"
  ];

  programs.man.generateCaches = false;
}
