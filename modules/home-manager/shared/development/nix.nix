{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixd
    nixfmt
    sops
    ssh-to-age
    statix
    deadnix
  ];
}
