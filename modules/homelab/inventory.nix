let
  domain = "home.arpa";
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
      in
      {
        name = serviceName;
        value = definition // {
          machine = machineName;
          inherit (machine) address;
          domain = if definition.proxy then "${serviceName}.${domain}" else null;
        };
      }
    ) machine.services
  ) (builtins.attrNames machines);
in
{
  inherit domain machines;
  services = builtins.listToAttrs servicePlacements;
}
