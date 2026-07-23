{ osConfig, ... }:

{
  imports = [
    ../education.nix
    ../git.nix
    ../editors/zed.nix

    ../../../modules/home/core/cli.nix
    ../../../modules/home/core/fish.nix
    ../../../modules/home/core/git.nix
    ../../../modules/home/core/network.nix

    ../../../modules/home/editors/helix.nix
    ../../../modules/home/editors/vim.nix

    ../../../modules/home/roles/homelab-client.nix

    ../../../modules/home/terminal/kitty.nix

    ../../../modules/home/development/codex.nix
    ../../../modules/home/development/containers.nix
    ../../../modules/home/development/cpp.nix
    ../../../modules/home/development/file-formats.nix
    ../../../modules/home/development/go.nix
    ../../../modules/home/development/just.nix
    ../../../modules/home/development/lua.nix
    ../../../modules/home/development/nix.nix
    ../../../modules/home/development/python.nix
    ../../../modules/home/development/rust.nix
    ../../../modules/home/development/shell.nix
    ../../../modules/home/development/web.nix
  ];

  home = {
    username = "vleksis";
    stateVersion = "26.05";

    sessionVariables = {
      NIX_HOST = osConfig.networking.hostName;

      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  programs.home-manager.enable = true;
}
