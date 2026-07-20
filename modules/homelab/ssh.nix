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
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF+NQ9bFqQLcMHW50/Evq4nPc0HdEwjacVt3Gp3rIsrT vleksis@Maltsevs-MacBook-Air.local"
  ];
}
