{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    btop
    fastfetch
    tree
    jq
    just

    zip
    unzip
    p7zip

    shellcheck
  ];
}
