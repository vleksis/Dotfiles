{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    btop
    fastfetch
    tree
    jq

    gzip
    zip
    unzip
    p7zip
  ];

  programs.bat.enable = true;
}
