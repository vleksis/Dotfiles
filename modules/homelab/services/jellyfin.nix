{ hostName, inventory, ... }:

let
  hostAddress = inventory.machines.${hostName}.address;
in
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  systemd.services.jellyfin = {
    after = [ "torrent-vpn-proxy.service" ];
    wants = [ "torrent-vpn-proxy.service" ];

    environment = {
      # Route external metadata and artwork requests through AmneziaWG.
      ALL_PROXY = "socks5://127.0.0.1:1080";

      # Keep local service traffic on the LAN.
      NO_PROXY = "localhost,127.0.0.1,::1,home.arpa,.home.arpa,${hostAddress}";
    };
  };
}
