{ inventory, ... }:

let
  flaresolverr = inventory.services.flaresolverr;
  torrentVpn = inventory.services."torrent-vpn";
  vpnProxyUnit = "torrent-vpn-proxy.service";
in
{
  services.flaresolverr = {
    enable = true;
    inherit (flaresolverr) port;
    openFirewall = false;
  };

  systemd.services.flaresolverr = {
    after = [ vpnProxyUnit ];
    wants = [ vpnProxyUnit ];

    environment.PROXY_URL = "socks5://127.0.0.1:${toString torrentVpn.socksPort}";
  };
}
