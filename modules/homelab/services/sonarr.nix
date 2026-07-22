{
  hostName,
  inventory,
  lib,
  ...
}:

let
  sonarr = inventory.services.sonarr;
  torrentVpn = inventory.services."torrent-vpn";
  hostAddress = inventory.machines.${hostName}.address;
in
{
  services.sonarr = {
    enable = true;
    openFirewall = false;
    group = "media";

    settings.server = {
      inherit (sonarr) port;
      bindaddress = "0.0.0.0";
    };
  };

  systemd.services.sonarr = {
    after = [ "torrent-vpn-proxy.service" ];
    wants = [ "torrent-vpn-proxy.service" ];

    environment = {
      # Route external metadata and indexer requests through AmneziaWG.
      ALL_PROXY = "socks5://127.0.0.1:${toString torrentVpn.socksPort}";

      # Keep qBittorrent, Prowlarr, and other local traffic off the proxy.
      NO_PROXY = "localhost,127.0.0.1,::1,home.arpa,.home.arpa,${hostAddress}";
    };

    serviceConfig.UMask = lib.mkForce "0002";
  };
}
