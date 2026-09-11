{
  daru = {
    address = "192.168.31.201";

    ssh = {
      port = 22;
      user = "admin";
    };

    services = [
      "adguard"
      "caddy"
    ];
  };

  okabe = {
    address = "192.168.31.200";

    ssh = {
      port = 22;
      user = "admin";
    };

    services = [
      "bazarr"
      "convertx"
      "flaresolverr"
      "homepage"
      "jellyfin"
      "media"
      "miniflux"
      "prowlarr"
      "qbittorrent"
      "radarr"
      "sonarr"
      "torrent-vpn"
    ];
  };
}
