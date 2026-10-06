{
  daru = {
    address = "192.168.31.202";

    ssh = {
      port = 22;
      user = "admin";
    };

    services = [
      "adguard"
      "caddy"
      "homepage"
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
      "jellyfin"
      "miniflux"
      "prowlarr"
      "qbittorrent"
      "radarr"
      "sonarr"
    ];
  };

  router = {
    address = "192.168.31.1";
    services = [ "router" ];
  };

  switch = {
    address = "192.168.31.203";
    services = [ "switch" ];
  };
}
