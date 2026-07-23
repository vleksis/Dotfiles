{ pkgs, ... }:

{
  programs.zed-editor = {
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
}
