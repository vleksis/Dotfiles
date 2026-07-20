{
  hostName,
  pkgs,
  ...
}:

{
  imports = [
    ../modules/cli.nix
    ../modules/fish.nix
    ../modules/git.nix

    ../modules/development/just.nix
    ../modules/development/nix.nix
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
      NIX_HOST = hostName;

      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  programs = {
    helix.enable = true;
    home-manager.enable = true;
  };
}
