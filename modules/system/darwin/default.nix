{ pkgs, ... }:

{
  imports = [
    ../shared
  ];

  environment.shells = [
    pkgs.fish
  ];
}
