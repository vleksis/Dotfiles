{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vim-language-server

    taplo
    yaml-language-server
    yamlfmt
    yamllint
    marksman

    actionlint
  ];
}
