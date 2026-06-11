{ config, pkgs, ...}:

{
  xdg.configFile = {
    "fish/completions" = {
      source = ./completions;
      recursive = true;
    };

    "fish/conf.d" = {
      source = ./conf.d;
      recursive = true;
    };

    "fish/functions" = {
      source = ./functions;
      recursive = true;
    };

    "fish/config.fish" = {
      source = ./config.fish;
    };
  };
}
