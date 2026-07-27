_:

{
  programs.git.settings = {
    user.name = "vleksis";
    user.email = "vleksis@yandex.ru";

    url = {
      "ssh://git@github.com/vleksis" = {
        insteadOf = "https://github.com/vleksis";
      };

      "ssh://git@gitlab.com/vleksis" = {
        insteadOf = "https://gitlab.com/vleksis";
      };
    };
  };
}
