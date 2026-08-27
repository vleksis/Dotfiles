{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang-tools
    cmake
    gnumake
    pkg-config
    openssl
  ];
}
