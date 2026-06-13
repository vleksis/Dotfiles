{
  ...
}:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza --oneline --icons --git --group-directories-first --hyperlink --color=auto $argv";
    };
  };

  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
  };

  programs.mcfly = {
    enable = true;
    enableFishIntegration = true;
    fuzzySearchFactor = 2;
    fzf.enable = true;
    keyScheme = "vim";
  };
}
