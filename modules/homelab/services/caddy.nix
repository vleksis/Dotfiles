{ inventory, lib, ... }:

let
  caddy = inventory.services.caddy;
  proxyServices = lib.filterAttrs (_name: service: service.proxy) inventory.services;
in
{
  services.caddy = {
    enable = true;
    openFirewall = true;
    httpPort = caddy.port;
    httpsPort = null;

    virtualHosts = lib.mapAttrs' (
      _serviceName: service:
      lib.nameValuePair "http://${service.domain}" {
        extraConfig = ''
          reverse_proxy ${service.address}:${toString service.port}
        '';
      }
    ) proxyServices;
  };
}
