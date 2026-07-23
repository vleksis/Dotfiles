{
  osConfig,
  pkgs,
  ...
}:

{
  imports = [
    ../git.nix

    ../../../modules/home/core/cli.nix
    ../../../modules/home/core/fish.nix
    ../../../modules/home/core/git.nix

    ../../../modules/home/development/just.nix
    ../../../modules/home/development/nix.nix
  ];

  home = {
    username = "vleksis";
    homeDirectory = "/home/vleksis";
    stateVersion = "26.05";

    packages = with pkgs; [
      curl
      dig
      wget
    ];

    sessionVariables = {
      NIX_HOST = osConfig.networking.hostName;

      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  programs = {
    helix.enable = true;
    home-manager.enable = true;
  };
}
