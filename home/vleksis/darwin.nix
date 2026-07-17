{
  codexPackage,
  pkgs,
  ...
}:

{
  imports = [
    ./common.nix
    ./packages/core.nix
  ];

  home.homeDirectory = "/Users/vleksis";
  home.packages = [ codexPackage ];

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font Mono";
      package = pkgs.nerd-fonts.fira-code;
      size = 14;
    };
    settings = {
      macos_option_as_alt = "both";
      shell = "${pkgs.fish}/bin/fish --login --interactive";

      scrollback_lines = 10000;
      scrollbar = "scrolled";

      copy_on_select = true;
      strip_trailing_spaces = "smart";
      paste_actions = "quote-urls-at-prompt,confirm";

      notify_on_cmd_finish = "unfocused";

      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };

  programs.man.generateCaches = false;
}
