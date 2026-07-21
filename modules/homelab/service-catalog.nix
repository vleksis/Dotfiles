{
  adguard = {
    port = 3000;
    title = "AdGuard Home";
    description = "DNS filtering and local rewrites";
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

  jellyfin = {
    port = 8096;
    title = "Jellyfin";
    description = "Movies, shows, and music";
    proxy = true;
    dashboard = true;
  };

  homepage = {
    port = 8082;
    title = "Homepage";
    description = "Homelab dashboard";
    proxy = true;
    dashboard = false;
  };

  ssh = {
    port = 22;
    title = "SSH";
    description = "Remote shell access";
    proxy = false;
    dashboard = false;
  };
}
