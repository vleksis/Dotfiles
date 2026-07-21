{ lib, ... }:

let
  homelab = import ../inventory.nix;
  caddy = homelab.services.caddy;
  proxyServices = lib.filterAttrs (_name: service: service.proxy) homelab.services;
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
        rewrites = lib.mapAttrsToList (_serviceName: service: {
          inherit (service) domain;
          answer = caddy.address;
          enabled = true;
        }) proxyServices;
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 53 ];
    allowedUDPPorts = [ 53 ];
  };
}
