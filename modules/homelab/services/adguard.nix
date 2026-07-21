let
  adguard = (import ../machines.nix).services.adguard;
in
{
  # Route the host's own DNS queries through AdGuard Home instead of accepting
  # the DNS server advertised by DHCP.
  networking.resolvconf.useLocalResolver = true;

  services.adguardhome = {
    enable = true;

    host = "0.0.0.0";
    inherit (adguard) port;

    mutableSettings = true;

    settings = {
      dns = {
        bind_hosts = [
          "127.0.0.1"
          adguard.address
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
    };
  };

  networking.firewall = {
    allowedTCPPorts = [
      53
      adguard.port
    ];
    allowedUDPPorts = [ 53 ];
  };
}
