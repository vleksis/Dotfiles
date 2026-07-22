{ pkgs, ... }:

{
  programs = {
    vim.enable = true;

    helix = {
      enable = true;

      languages.language = [
        {
          name = "markdown";
          language-servers = [ "markdown-oxide" ];
        }
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
        "markdown-oxide"
        "nix"
      ];

      extraPackages = with pkgs; [
        codex-acp
        markdown-oxide
      ];

      userSettings = {
        terminal.font_family = "FiraCode Nerd Font Mono";
      };
    };
  };
}
