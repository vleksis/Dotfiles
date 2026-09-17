_:

{
  imports = [
    ./dns.nix
    ./reverse-proxy.nix
    ./services
    ./ssh.nix
  ];

  sops = {
    useSystemdActivation = true;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  };
}
