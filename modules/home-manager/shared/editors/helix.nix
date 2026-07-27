_:

{
  programs.helix = {
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
}
