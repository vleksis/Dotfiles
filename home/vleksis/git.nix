{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "vleksis";
      user.email = "vleksis@yandex.ru";

      init.defaultBranch = "main";
      trim.bases = "develop,master,main";

      url = {
        "ssh://git@github.com/vleksis" = {
          insteadOf = "https://github.com/vleksis";
        };

        "ssh://git@gitlab.com/vleksis" = {
          insteadOf = "https://gitlab.com/vleksis";
        };
      };

      alias = {
        co = "checkout";
        dc = "diff --cached";
        amend = "commit --amend";
      };
    };
  };

  programs.gh.enable = true;

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      navigate = true;
      side-by-side = true;
      true-color = "always";
    };
  };
}
