{
  # INFRA
  router = {
    port = 80;
    proxy = {
      enable = true;
      subdomain = "router";
      useUpstreamHost = true;
    };

    dashboard = {
      enable = true;
      group = "Network";

      title = "Router";
      icon = "mdi-router-wireless";
      description = "Xiaomi router";
    };
  };

  switch = {
    port = 80;
    proxy = {
      enable = true;
      subdomain = "switch";
    };

    dashboard = {
      enable = true;
      group = "Network";

      title = "Switch";
      icon = "mdi-network";
      description = "TP-Link TL-SG108E";
    };
  };

  # SERVICES
  adguard = {
    port = 3000;
    proxy = {
      enable = true;
      subdomain = "adguard";
    };

    dashboard = {
      enable = true;

      title = "AdGuard Home";
      icon = "adguard-home.svg";
      description = "DNS filtering and local rewrites";

      widget.type = "adguard";
    };
  };

  bazarr = {
    port = 6767;
    proxy = {
      enable = true;
      subdomain = "bazarr";
    };

    dashboard = {
      enable = true;

      title = "Bazarr";
      icon = "bazarr.svg";
      description = "Subtitle management";

      widget.type = "bazarr";
    };
  };

  caddy = {
    port = 80;
    proxy = {
      enable = false;
    };
    dashboard.enable = false;
  };

  convertx = {
    port = 3001;
    proxy = {
      enable = true;
      subdomain = "convertx";
    };

    dashboard = {
      enable = true;

      title = "ConvertX";
      icon = "convertx.png";
      description = "File conversion";
    };
  };

  flaresolverr = {
    port = 8191;
    proxy = {
      enable = false;
    };
    dashboard.enable = false;
  };

  homepage = {
    port = 8082;
    proxy = {
      enable = true;
      subdomain = "homepage";
    };
    dashboard.enable = false;
  };

  jellyfin = {
    port = 8096;
    proxy = {
      enable = true;
      subdomain = "jellyfin";
    };

    dashboard = {
      enable = true;

      title = "Jellyfin";
      icon = "jellyfin.svg";
      description = "Movies, shows, and music";

      widget = {
        type = "jellyfin";
        enableBlocks = true;
      };
    };
  };

  miniflux = {
    port = 20001;
    proxy = {
      enable = true;
      subdomain = "miniflux";
    };

    dashboard = {
      enable = true;

      title = "Miniflux";
      icon = "miniflux.svg";
      description = "Feed reader";

      widget.type = "miniflux";
    };
  };

  prowlarr = {
    port = 9696;
    proxy = {
      enable = true;
      subdomain = "prowlarr";
    };

    dashboard = {
      enable = true;

      title = "Prowlarr";
      icon = "prowlarr.svg";
      description = "Indexer management";

      widget.type = "prowlarr";
    };
  };

  qbittorrent = {
    port = 8080;
    proxy = {
      enable = true;
      subdomain = "qbittorrent";
    };

    dashboard = {
      enable = true;

      title = "qBittorrent";
      icon = "qbittorrent.svg";
      description = "Torrent downloads";
    };
  };

  radarr = {
    port = 7878;
    proxy = {
      enable = true;
      subdomain = "radarr";
    };

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
    proxy = {
      enable = true;
      subdomain = "sonarr";
    };

    dashboard = {
      enable = true;

      title = "Sonarr";
      icon = "sonarr.svg";
      description = "Series management";

      widget = {
        type = "sonarr";
        enableQueue = true;
      };
    };
  };
}
