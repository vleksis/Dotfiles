{
  adguard = {
    port = 3000;
    title = "AdGuard Home";
    icon = "adguard-home.svg";
    description = "DNS filtering and local rewrites";
    proxy = true;
    dashboard = true;
  };

  bazarr = {
    port = 6767;
    title = "Bazarr";
    icon = "bazarr.svg";
    description = "Subtitle management";
    proxy = true;
    dashboard = true;
  };

  caddy = {
    port = 80;
    title = "Caddy";
    description = "Local reverse proxy";
    proxy = false;
    dashboard = false;
  };

  homepage = {
    port = 8082;
    title = "Homepage";
    description = "Homelab dashboard";
    proxy = true;
    dashboard = false;
  };

  jellyfin = {
    port = 8096;
    title = "Jellyfin";
    icon = "jellyfin.svg";
    description = "Movies, shows, and music";
    proxy = true;
    dashboard = true;
  };

  media = {
    port = null;
    title = "Media storage";
    description = "Shared media downloads and libraries";
    proxy = false;
    dashboard = false;
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
    title = "Prowlarr";
    icon = "prowlarr.svg";
    description = "Indexer management";
    proxy = true;
    dashboard = true;
  };

  qbittorrent = {
    port = 8080;
    title = "qBittorrent";
    icon = "qbittorrent.svg";
    description = "Torrent downloads";
    proxy = true;
    dashboard = true;
  };

  radarr = {
    port = 7878;
    title = "Radarr";
    icon = "radarr.svg";
    description = "Movie management";
    proxy = true;
    dashboard = true;
  };

  sonarr = {
    port = 8989;
    title = "Sonarr";
    icon = "sonarr.svg";
    description = "Series management";
    proxy = true;
    dashboard = true;
  };

  ssh = {
    port = 22;
    title = "SSH";
    description = "Remote shell access";
    proxy = false;
    dashboard = false;
  };

  torrent-vpn = {
    port = null;
    title = "Torrent VPN";
    description = "Isolated AmneziaWG routing for torrent traffic";
    proxy = false;
    dashboard = false;
    interface = "awg-qbt";
    socksPort = 1080;
  };
}
