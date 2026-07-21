{ lib, ... }:

let
  homelab = import ../machines.nix;
  caddyMachine = homelab.machines.homelab;
in
{
  networking.resolvconf.useLocalResolver = true;

  services.adguardhome = {
    enable = true;

    host = "0.0.0.0";
    port = homelab.services.adguard.port;

    mutableSettings = true;

    settings = {
      dns = {
        bind_hosts = [
          "127.0.0.1"
          homelab.services.adguard.address
          "::1"
        ];

        port = 53;

        upstream_dns = [
          "https://cloudflare-dns.com/dns-query"
          "https://dns.quad9.net/dns-query"
        ];

        bootstrap_dns = [
          "1.1.1.1"
          "9.9.9.9"
        ];
      };

      filtering = {
        rewrites = lib.mapAttrsToList (serviceName: _service: {
          domain = "${serviceName}.${homelab.domain}";
          answer = caddyMachine.address;
          enabled = true;
        }) homelab.services;
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 53 ];
    allowedUDPPorts = [ 53 ];
  };
}
