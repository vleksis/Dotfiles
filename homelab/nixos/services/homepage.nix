{
  config,
  inventory,
  lib,
  ...
}:

let
  homepage = inventory.services.homepage;
  dashboardServices = lib.filterAttrs (_name: service: service.dashboard.enable) inventory.services;
  # Widget credentials belong to Homepage, regardless of where each service runs.
  apiKeyServiceNames = [
    "bazarr"
    "jellyfin"
    "miniflux"
    "prowlarr"
    "radarr"
    "sonarr"
  ];
  hasApiKey = serviceName: builtins.elem serviceName apiKeyServiceNames;
  apiKeyServices = lib.filterAttrs (
    serviceName: service: service.dashboard ? widget && hasApiKey serviceName
  ) dashboardServices;
  environmentVariable = serviceName: "HOMEPAGE_FILE_${lib.toUpper serviceName}_API_KEY";
in
{
  sops.secrets = lib.mapAttrs' (
    serviceName: _:
    lib.nameValuePair "${serviceName}-api-key" {
      restartUnits = [ "homepage-dashboard.service" ];
    }
  ) apiKeyServices;

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
        Homelab = lib.mapAttrsToList (serviceName: service: {
          "${service.dashboard.title}" = {
            href = service.url;
            siteMonitor = service.url;
            inherit (service.dashboard) description icon;
          }
          // lib.optionalAttrs (service.dashboard ? widget) {
            widget =
              service.dashboard.widget
              // {
                inherit (service) url;
              }
              // lib.optionalAttrs (hasApiKey serviceName) {
                key = "{{${environmentVariable serviceName}}}";
              };
          };
        }) dashboardServices;
      }
    ];
  };

  systemd.services.homepage-dashboard = {
    environment = lib.mapAttrs' (
      serviceName: _: lib.nameValuePair (environmentVariable serviceName) "%d/${serviceName}-api-key"
    ) apiKeyServices;

    serviceConfig.LoadCredential = lib.mapAttrsToList (
      serviceName: _: "${serviceName}-api-key:${config.sops.secrets."${serviceName}-api-key".path}"
    ) apiKeyServices;
  };
}
