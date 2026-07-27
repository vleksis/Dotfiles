{ pkgs, ... }:

{
  home.packages = with pkgs; [
    shellcheck
    bash-language-server
    shfmt
    fish-lsp
  ];
}
