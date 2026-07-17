{ pkgs, ... }:

{
  home.packages = with pkgs; [
    go
    gopls
    gotools
    gofumpt
    golangci-lint
    delve
  ];
}
