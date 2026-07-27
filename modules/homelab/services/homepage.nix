{ inventory, lib, ... }:

let
  homepage = inventory.services.homepage;
  dashboardServices = lib.filterAttrs (_name: service: service.dashboard.enable) inventory.services;
in
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = homepage.port;
    allowedHosts = homepage.domain;

    settings = {
      title = "Homelab";
      headerStyle = "clean";
      hideVersion = true;

      statusStyle = "dot";
    };

    services = [
      {
        Homelab = lib.mapAttrsToList (_serviceName: service: {
          "${service.dashboard.title}" = {
            href = service.url;
            siteMonitor = service.url;
            inherit (service.dashboard) description icon;
          };
        }) dashboardServices;
      }
    ];
  };
}
