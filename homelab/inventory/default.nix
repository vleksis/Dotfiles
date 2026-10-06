let
  topDomain = "home.arpa";
  nodes = import ./nodes.nix;
  catalog = import ./catalog.nix;
  infrastructure = import ./infrastructure.nix;

  resolveService =
    serviceName: address:
    let
      definition = catalog.${serviceName};
      domain = if definition.proxy then "${serviceName}.${topDomain}" else null;
      endpoint = "${address}:${toString definition.port}";
    in
    definition
    // {
      inherit address domain endpoint;
      url = if domain == null then null else "http://${domain}";
    };

  servicePlacements = builtins.concatMap (
    nodeName:
    let
      node = nodes.${nodeName};
    in
    map (serviceName: {
      name = serviceName;
      value = resolveService serviceName node.address // {
        node = nodeName;
      };
    }) node.services
  ) (builtins.attrNames nodes);
in
{
  inherit topDomain nodes infrastructure;
  services = builtins.listToAttrs servicePlacements;
}
