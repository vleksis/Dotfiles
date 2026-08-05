{
  config,
  inventory,
  ...
}:

let
  convertx = inventory.services.convertx;
  dataDirectory = "/var/lib/convertx";
in
{
  sops.secrets.convertx-jwt-secret.restartUnits = [ "podman-convertx.service" ];

  sops.templates."convertx.env".content = ''
    JWT_SECRET=${config.sops.placeholder.convertx-jwt-secret}
  '';

  systemd.tmpfiles.rules = [ "d ${dataDirectory} 0700 root root - -" ];

  virtualisation.oci-containers.containers.convertx = {
    image = "ghcr.io/c4illin/convertx:v0.18.0@sha256:b515b04bfd25298a5cdc775b2fcd48b9399bab658ce13e2598b65df1b16098c8";

    ports = [ "${convertx.endpoint}:3000" ];
    volumes = [ "${dataDirectory}:/app/data" ];
    environment.HTTP_ALLOWED = "true";
    environmentFiles = [ config.sops.templates."convertx.env".path ];
  };
}
