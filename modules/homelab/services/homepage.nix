let
  homelab = import ../machines.nix;
in
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = homelab.services.homepage.port;
    allowedHosts = "homepage.${homelab.domain}";

    settings = {
      title = "Homelab";
      headerStyle = "clean";
      hideVersion = true;
    };

    services = [
      {
        Homelab = [
          {
            "AdGuard Home" = {
              href = homelab.services.adguard.domain;
              description = "DNS filtering and local rewrites";
            };
          }
          {
            Jellyfin = {
              href = homelab.services.jellyfin.domain;
              description = "Movies, shows, and music";
            };
          }
        ];
      }
    ];
  };
}
