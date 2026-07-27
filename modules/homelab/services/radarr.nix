{
  config,
  inventory,
  lib,
  ...
}:

let
  radarr = inventory.services.radarr;
in
{
  sops.secrets.radarr-api-key.restartUnits = [
    "homepage-dashboard.service"
    "radarr.service"
  ];

  sops.templates."radarr.env".content = ''
    RADARR__AUTH__APIKEY=${config.sops.placeholder.radarr-api-key}
  '';

  services.radarr = {
    enable = true;
    openFirewall = false;
    group = "media";

    settings.server = {
      inherit (radarr) port;
      bindaddress = "0.0.0.0";
    };

    environmentFiles = [ config.sops.templates."radarr.env".path ];
  };

  systemd.services.radarr.serviceConfig.UMask = lib.mkForce "0002";
}
