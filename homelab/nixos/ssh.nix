{ inventory, nodeName, ... }:

let
  ssh = inventory.nodes.${nodeName}.ssh;
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
