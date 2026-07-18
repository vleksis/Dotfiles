{ pkgs, ... }:

{
  programs = {
    vim.enable = true;

    helix = {
      enable = true;

      languages.language = [
        {
          name = "nix";
          language-servers = [ "nixd" ];
        }
      ];
    };

    zed-editor = {
      enable = true;

      extensions = [
        "just"
        "nix"
      ];

      extraPackages = [ pkgs.codex-acp ];

      userSettings = {
        terminal.font_family = "FiraCode Nerd Font Mono";
      };
    };
  };
}
