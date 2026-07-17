{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    fzf
    btop
    fastfetch
    tree
    jq
    just

    zip
    unzip
    p7zip

    mcfly

    gh
    shellcheck
  ];
}
