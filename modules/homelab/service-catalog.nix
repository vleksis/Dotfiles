{
  adguard = {
    port = 3000;
    proxy = true;

    dashboard = {
      enable = true;

      title = "AdGuard Home";
      icon = "adguard-home.svg";
      description = "DNS filtering and local rewrites";
    };
  };

  bazarr = {
    port = 6767;
    proxy = true;

    dashboard = {
      enable = true;

      title = "Bazarr";
      icon = "bazarr.svg";
      description = "Subtitle management";
    };
  };

  caddy = {
    port = 80;
    proxy = false;
    dashboard.enable = false;
  };

  homepage = {
    port = 8082;
    proxy = true;
    dashboard.enable = false;
  };

  jellyfin = {
    port = 8096;
    proxy = true;

    dashboard = {
      enable = true;

      title = "Jellyfin";
      icon = "jellyfin.svg";
      description = "Movies, shows, and music";
    };
  };

  media = {
    port = null;
    proxy = false;
    dashboard.enable = false;

    paths = {
      root = "/srv/media";
      downloads = "/srv/media/downloads/movies";
      library = "/srv/media/library/movies";
      series = {
        downloads = "/srv/media/downloads/series";
        library = "/srv/media/library/series";
      };
    };
  };

  prowlarr = {
    port = 9696;
    proxy = true;

    dashboard = {
      enable = true;

      title = "Prowlarr";
      icon = "prowlarr.svg";
      description = "Indexer management";
    };
  };

  qbittorrent = {
    port = 8080;
    proxy = true;

    dashboard = {
      enable = true;

      title = "qBittorrent";
      icon = "qbittorrent.svg";
      description = "Torrent downloads";
    };
  };

  radarr = {
    port = 7878;
    proxy = true;

    dashboard = {
      enable = true;

      title = "Radarr";
      icon = "radarr.svg";
      description = "Movie management";

      widget = {
        type = "radarr";
        enableQueue = true;
      };
    };
  };

  sonarr = {
    port = 8989;
    proxy = true;

    dashboard = {
      enable = true;

      title = "Sonarr";
      icon = "sonarr.svg";
      description = "Series management";
    };
  };

  ssh = {
    port = 22;
    proxy = false;
    dashboard.enable = false;
  };

  torrent-vpn = {
    port = null;
    proxy = false;
    dashboard.enable = false;

    interface = "awg-qbt";
    socksPort = 1080;
  };
}
