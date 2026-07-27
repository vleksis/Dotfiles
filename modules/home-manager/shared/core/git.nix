_:

{
  programs = {
    git = {
      enable = true;

      settings = {
        init.defaultBranch = "main";
        trim.bases = "develop,master,main";

        alias = {
          co = "checkout";
          lg = "log --oneline --graph --decorate";
          dc = "diff --cached";
          amend = "commit --amend";
        };
      };
    };

    gh.enable = true;

    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        line-numbers = true;
        navigate = true;
        side-by-side = true;
        true-color = "always";
      };
    };
  };
}
