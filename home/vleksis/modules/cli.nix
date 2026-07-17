{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    btop
    fastfetch
    tree
    jq
    just

    zip
    unzip
    p7zip
  ];

  programs.bat.enable = true;

  programs.fzf = {
    enable = true;
    historyWidget.fish.command = "";
  };
}
