{ inventory, lib, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "~/.ssh/config.local" ];

    settings = lib.mapAttrs (_nodeName: node: {
      HostName = node.address;
      Port = node.ssh.port;
      User = node.ssh.user;

      IdentityFile = "~/.ssh/id_ed25519";
      IdentitiesOnly = true;
      ForwardAgent = false;
    }) inventory.nodes;
  };
}
