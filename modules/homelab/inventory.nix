let
  topDomain = "home.arpa";
  nodes = import ./nodes.nix;
  catalog = import ./service-catalog.nix;

  servicePlacements = builtins.concatMap (
    nodeName:
    let
      node = nodes.${nodeName};
    in
    map (
      serviceName:
      let
        definition = catalog.${serviceName};
        domain = if definition.proxy then "${serviceName}.${topDomain}" else null;
      in
      {
        name = serviceName;
        value = definition // {
          node = nodeName;
          inherit (node) address;
          inherit domain;
          url = if domain == null then null else "http://${domain}";
        };
      }
    ) node.services
  ) (builtins.attrNames nodes);
in
{
  inherit topDomain nodes;
  services = builtins.listToAttrs servicePlacements;
}
