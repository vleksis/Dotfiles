{ lib, ... }:

let
  homelab = import ../inventory.nix;
  caddy = homelab.services.caddy;
  proxyServices = lib.filterAttrs (_name: service: service.proxy) homelab.services;
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
