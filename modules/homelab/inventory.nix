let
  topDomain = "home.arpa";
  machines = import ./machines.nix;
  catalog = import ./service-catalog.nix;

  servicePlacements = builtins.concatMap (
    machineName:
    let
      machine = machines.${machineName};
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
          machine = machineName;
          inherit (machine) address;
          inherit domain;
          url = if domain == null then null else "http://${domain}";
        };
      }
    ) machine.services
  ) (builtins.attrNames machines);
in
{
  inherit topDomain machines;
  services = builtins.listToAttrs servicePlacements;
}
