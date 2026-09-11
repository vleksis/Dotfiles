{
  inventory,
  lib,
  nodeName,
  ...
}:

let
  node = inventory.nodes.${nodeName};
  caddy = inventory.services.caddy;
  proxyUpstreams = builtins.filter (service: service.proxy && service.node != caddy.node) (
    map (serviceName: inventory.services.${serviceName}) node.services
  );
in
{
  networking.firewall.extraCommands = lib.mkAfter (
    lib.concatMapStrings (service: ''
      iptables -w -A nixos-fw \
        --source ${caddy.address}/32 \
        --destination ${node.address}/32 \
        --protocol tcp \
        --dport ${toString service.port} \
        --jump nixos-fw-accept
    '') proxyUpstreams
  );
}
