{ config, inventory, ... }:

let
  miniflux = inventory.services.miniflux;
in
{
  sops.secrets = {
    miniflux-admin-password = { };
    miniflux-api-key.restartUnits = [ "homepage-dashboard.service" ];
  };

  sops.templates."miniflux-admin.env".content = ''
    ADMIN_USERNAME=admin
    ADMIN_PASSWORD=${config.sops.placeholder.miniflux-admin-password}
  '';

  services.miniflux = {
    enable = true;
    adminCredentialsFile = config.sops.templates."miniflux-admin.env".path;

    config = {
      BASE_URL = miniflux.url;
      LISTEN_ADDR = miniflux.endpoint;
    };
  };
}
