{ inventory, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "~/.ssh/config.local" ];

    settings.okabe = {
      HostName = inventory.nodes.okabe.address;
      Port = inventory.services.ssh.port;
      User = "admin";

      IdentityFile = "~/.ssh/id_ed25519";
      IdentitiesOnly = true;
      ForwardAgent = false;
    };
  };
}
