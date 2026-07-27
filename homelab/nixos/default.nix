_:

{
  imports = [ ./services ];

  sops = {
    useSystemdActivation = true;
    defaultSopsFile = ../../secrets/homelab.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets.test-secret = { };
  };
}
