{ pkgs, ... }:

{
  home.packages = with pkgs; [
    curl
    inetutils
    ngrok
    wget
    dig
  ];
}
