{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
    cliphist

    awww
    swayidle
    grim
    slurp
    swappy
    wf-recorder

    fuzzel
    xwayland-satellite
  ];
}
