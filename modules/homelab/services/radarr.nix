{ inventory, lib, ... }:

let
  radarr = inventory.services.radarr;
in
{
  services.radarr = {
    enable = true;
    openFirewall = false;
    group = "media";

    settings.server = {
      inherit (radarr) port;
      bindaddress = "0.0.0.0";
    };
  };

  systemd.services.radarr.serviceConfig.UMask = lib.mkForce "0002";
}
