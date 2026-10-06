{
  config,
  inventory,
  lib,
  ...
}:

let
  homepage = inventory.services.homepage;
  dashboardServices = lib.filterAttrs (_name: service: service.dashboard.enable) inventory.services;
  dashboardGroups = lib.groupBy (
    serviceName: dashboardServices.${serviceName}.dashboard.group or "Homelab"
  ) (builtins.attrNames dashboardServices);
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
      sopsFile = ../../../secrets/homepage.yaml;
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

    services = lib.mapAttrsToList (group: serviceNames: {
      "${group}" = map (
        serviceName:
        let
          service = dashboardServices.${serviceName};
        in
        {
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
        }
      ) serviceNames;
    }) dashboardGroups;
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
