{
  osConfig,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/home/core/fish.nix
    ../../modules/home/core/git.nix
    ../../modules/home/editors/helix.nix
    ../../modules/home/development/just.nix
    ../../modules/home/development/nix.nix
  ];

  home = {
    username = "admin";
    homeDirectory = "/home/admin";
    stateVersion = "26.05";

    packages = with pkgs; [
      btop
      curl
      dig
      markdown-oxide
      wget
    ];

    sessionVariables = {
      NIX_HOST = osConfig.networking.hostName;

      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  programs.home-manager.enable = true;
}
