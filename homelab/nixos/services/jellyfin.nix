{ inventory, nodeName, ... }:

let
  hostAddress = inventory.nodes.${nodeName}.address;
  socksPort = inventory.services.torrent-vpn.socksPort;
in
{
  sops.secrets.jellyfin-api-key.restartUnits = [ "homepage-dashboard.service" ];

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.jellyfin = {
    after = [ "torrent-vpn-proxy.service" ];
    wants = [ "torrent-vpn-proxy.service" ];

    environment = {
      # Route external metadata and artwork requests through AmneziaWG.
      ALL_PROXY = "socks5://127.0.0.1:${toString socksPort}";

      # Keep local service traffic on the LAN.
      NO_PROXY = "localhost,127.0.0.1,::1,home.arpa,.home.arpa,${hostAddress}";
    };
  };
}
