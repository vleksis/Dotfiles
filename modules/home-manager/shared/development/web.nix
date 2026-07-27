{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode-langservers-extracted
    typescript-language-server
    prettier
    biome
  ];
}
