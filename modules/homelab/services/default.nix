{ hostName, inventory, ... }:

let
  services = inventory.nodes.${hostName}.services;
in
{
  imports = map (name: ./. + "/${name}.nix") services;
}
