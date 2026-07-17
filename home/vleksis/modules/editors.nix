{ pkgs, ... }:

{
  programs.vim.enable = true;
  programs.helix.enable = true;

  programs.zed-editor = {
    enable = true;
    extraPackages = [ pkgs.codex-acp ];
  };
}
