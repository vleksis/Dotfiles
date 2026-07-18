{ pkgs, ... }:

{
  programs = {
    vim.enable = true;
    helix.enable = true;

    zed-editor = {
      enable = true;
      extraPackages = [ pkgs.codex-acp ];

      userSettings.terminal.font_family = "FiraCode Nerd Font Mono";
    };
  };
}
