{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "vleksis";
        email = "vleksis@yandex.ru";
      };
    };
  };
}
