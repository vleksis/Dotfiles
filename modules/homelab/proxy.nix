{ lib, ... }:
let
  homelab = import ./machines.nix;
  domain = "home.arpa";
in
{
  services.caddy = {
    enable = true;
    openFirewall = true;

    virtualHosts = lib.mapAttrs' (
      serviceName: service:
      lib.nameValuePair "${serviceName}.${domain}" {
        extraConfig = ''
          reverse_proxy ${service.address}:${toString service.port}
        '';
      }
    ) homelab.services;
  };
}
