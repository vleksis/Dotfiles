{ inventory, lib, ... }:

let
  caddy = inventory.services.caddy;
  proxyServices = lib.filterAttrs (_name: service: service.proxy.enable) inventory.services;
  familyDnsRedirect = "-p tcp -d 94.140.14.15 --dport 443 -m comment --comment adguard-family-dns-recovery -j DNAT --to-destination 94.140.15.16:443";
in
{
  networking.resolvconf.useLocalResolver = true;

  services.adguardhome = {
    enable = true;

    host = "0.0.0.0";
    port = inventory.services.adguard.port;

    mutableSettings = true;

    settings = {
      dns = {
        bind_hosts = [
          "127.0.0.1"
          inventory.services.adguard.address
          "::1"
        ];

        port = 53;

        upstream_dns = [
          "https://cloudflare-dns.com/dns-query"
          "https://dns.quad9.net/dns-query"
          "[/cache.nixos.org/]1.1.1.1"
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

    # The primary Family endpoint is unreachable here, and AdGuard 0.107.79 has
    # a typo in its hard-coded secondary: https://github.com/AdguardTeam/AdGuardHome/issues/8637
    # Use the working endpoint while preserving TLS and parental filtering.
    extraCommands = ''
      iptables -t nat -C OUTPUT ${familyDnsRedirect} 2>/dev/null || \
        iptables -t nat -A OUTPUT ${familyDnsRedirect}
    '';
    extraStopCommands = ''
      iptables -t nat -D OUTPUT ${familyDnsRedirect} 2>/dev/null || true
    '';
  };
}
