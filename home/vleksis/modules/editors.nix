{ pkgs, ... }:

{
  programs.vim.enable = true;
  programs.helix.enable = true;

  programs.zed-editor = {
    enable = true;
    extraPackages = [ pkgs.codex-acp ];

    userSettings.terminal.font_family = "FiraCode Nerd Font Mono";
  };
}
