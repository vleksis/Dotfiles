{ osConfig, ... }:

{
  imports = [
    ./git.nix

    ../../../modules/home-manager/shared/applications/anki.nix
    ../../../modules/home-manager/shared/core/cli.nix
    ../../../modules/home-manager/shared/core/fish.nix
    ../../../modules/home-manager/shared/core/git.nix
    ../../../modules/home-manager/shared/core/network.nix

    ../../../modules/home-manager/shared/editors/helix.nix
    ../../../modules/home-manager/shared/editors/vim.nix
    ../../../modules/home-manager/shared/editors/zed.nix

    ../../../homelab/home-manager/client.nix

    ../../../modules/home-manager/shared/terminal/kitty.nix

    ../../../modules/home-manager/shared/development/codex.nix
    ../../../modules/home-manager/shared/development/containers.nix
    ../../../modules/home-manager/shared/development/cpp.nix
    ../../../modules/home-manager/shared/development/file-formats.nix
    ../../../modules/home-manager/shared/development/go.nix
    ../../../modules/home-manager/shared/development/just.nix
    ../../../modules/home-manager/shared/development/lua.nix
    ../../../modules/home-manager/shared/development/nix.nix
    ../../../modules/home-manager/shared/development/python.nix
    ../../../modules/home-manager/shared/development/rust.nix
    ../../../modules/home-manager/shared/development/shell.nix
    ../../../modules/home-manager/shared/development/web.nix
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
