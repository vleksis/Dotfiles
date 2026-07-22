{ inventory, ... }:

let
  prowlarr = inventory.services.prowlarr;
in
{
  services.prowlarr = {
    enable = true;
    openFirewall = false;

    settings.server = {
      inherit (prowlarr) port;
      bindaddress = "0.0.0.0";
    };
  };

  # Knaben's API stalls partway through HTTP/2 responses over the torrent VPN,
  # while the same requests complete normally over HTTP/1.1.
  systemd.services.prowlarr.environment = {
    DOTNET_SYSTEM_NET_HTTP_SOCKETSHTTPHANDLER_HTTP2SUPPORT = "0";
  };
}
