{ lib, ... }:

let
  homelab = import ../inventory.nix;
  homepage = homelab.services.homepage;
  dashboardServices = lib.filterAttrs (_name: service: service.dashboard) homelab.services;
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
    };

    services = [
      {
        Homelab = lib.mapAttrsToList (_serviceName: service: {
          "${service.title}" = {
            href = "http://${service.domain}";
            inherit (service) description;
          };
        }) dashboardServices;
      }
    ];
  };
}
