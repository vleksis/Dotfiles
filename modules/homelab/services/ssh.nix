{ inventory, ... }:

let
  ssh = inventory.services.ssh;
in
{
  services.openssh = {
    enable = true;
    openFirewall = true;
    ports = [ ssh.port ];

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
