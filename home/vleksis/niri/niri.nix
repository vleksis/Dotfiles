{ config, pkgs, ...}:

{
  xdg.configFile = {
    "niri/cfg" = {
      source = ./cfg;
      recursive = true;
    };

    "niri/config.kdl" = {
      source = ./config.kdl;
    };
  };
}
