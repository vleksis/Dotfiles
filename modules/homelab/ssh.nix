_:

{
  services.openssh = {
    enable = true;
    openFirewall = true;

    settings = {
      AllowUsers = [ "vleksis" ];
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.vleksis.openssh.authorizedKeys.keys = [
    # macbook
  ];
}
