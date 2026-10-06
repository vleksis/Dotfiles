{ inventory, lib, ... }:

let
  caddy = inventory.services.caddy;
  proxyServices = lib.filterAttrs (_name: service: service.proxy.enable) inventory.services;
in
{
  services.caddy = {
    enable = true;
    openFirewall = true;
    httpPort = caddy.port;
    httpsPort = null;

    virtualHosts = lib.mapAttrs' (
      _serviceName: service:
      lib.nameValuePair service.url {
        extraConfig = ''
          reverse_proxy ${service.endpoint} {
            ${lib.optionalString (service.proxy.useUpstreamHost or false
            ) "header_up Host {upstream_hostport}"}
          }
        '';
      }
    ) proxyServices;
  };
}
