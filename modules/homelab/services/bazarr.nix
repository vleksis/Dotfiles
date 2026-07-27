{ inventory, lib, ... }:

let
  bazarr = inventory.services.bazarr;
in
{
  sops.secrets.bazarr-api-key.restartUnits = [ "homepage-dashboard.service" ];

  services.bazarr = {
    enable = true;
    openFirewall = false;
    listenPort = bazarr.port;
    group = "media";
  };

  systemd.services.bazarr.serviceConfig.UMask = lib.mkForce "0002";
}
