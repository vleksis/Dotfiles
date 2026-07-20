{ hostName, ... }:

{
  imports = [
    ../modules/cli.nix
    ../modules/editors.nix
    ../modules/education.nix
    ../modules/fish.nix
    ../modules/git.nix
    ../modules/network.nix
    ../modules/terminal/kitty.nix

    ../modules/development/codex.nix
    ../modules/development/containers.nix
    ../modules/development/cpp.nix
    ../modules/development/file-formats.nix
    ../modules/development/go.nix
    ../modules/development/just.nix
    ../modules/development/lua.nix
    ../modules/development/nix.nix
    ../modules/development/python.nix
    ../modules/development/rust.nix
    ../modules/development/shell.nix
    ../modules/development/web.nix
  ];

  home = {
    username = "vleksis";
    stateVersion = "26.05";

    sessionVariables = {
      NIX_HOST = hostName;

      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  programs.home-manager.enable = true;
}
