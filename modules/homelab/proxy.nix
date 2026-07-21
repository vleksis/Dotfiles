{ lib, ... }:
let
  homelab = import ./machines.nix;
  caddy = homelab.machines.homelab.services.caddy;
in
{
  services.caddy = {
    enable = true;
    openFirewall = true;
    httpPort = caddy.port;
    httpsPort = null;

    virtualHosts = lib.mapAttrs' (
      serviceName: service:
      lib.nameValuePair "http://${serviceName}.${homelab.domain}" {
        extraConfig = ''
          reverse_proxy ${service.address}:${toString service.port}
        '';
      }
    ) homelab.services;
  };
}
