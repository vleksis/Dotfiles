{ config, pkgs, ...}:

{
  xdg.configFile = {
    "noctalia/settings.json" = {
      source = ./settings.json;
    };
  };
}
