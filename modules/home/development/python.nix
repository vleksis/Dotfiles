{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    pyright
    ruff
    black
    isort
    uv
  ];
}
