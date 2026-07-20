_:

{
  # Route normal system DNS through AdGuard Home while keeping systemd-resolved
  # available for NetworkManager and AmneziaVPN.
  networking.nameservers = [ "127.0.0.1" ];
  services.resolved.settings.Resolve = {
    Domains = [ "~." ];
    FallbackDNS = [ ];
  };

  services.adguardhome = {
    enable = true;

    host = "0.0.0.0";
    port = 3000;

    mutableSettings = true;

    settings = {
      dns = {
        bind_hosts = [
          "127.0.0.1"
          "192.168.31.187"
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
      3000
    ];
    allowedUDPPorts = [ 53 ];
  };
}
