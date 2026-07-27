{
  config,
  inventory,
  lib,
  ...
}:

let
  homepage = inventory.services.homepage;
  dashboardServices = lib.filterAttrs (_name: service: service.dashboard.enable) inventory.services;
  hasApiKey = serviceName: builtins.hasAttr "${serviceName}-api-key" config.sops.secrets;
  apiKeyServices = lib.filterAttrs (
    serviceName: service: service.dashboard ? widget && hasApiKey serviceName
  ) dashboardServices;
  environmentVariable = serviceName: "HOMEPAGE_FILE_${lib.toUpper serviceName}_API_KEY";
in
{
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
