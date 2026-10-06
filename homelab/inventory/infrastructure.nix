{
  media = {
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

  torrent-vpn = {
    interface = "awg-qbt";
    socksPort = 1080;
  };
}
