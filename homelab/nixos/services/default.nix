{ inventory, nodeName, ... }:

let
  services = inventory.nodes.${nodeName}.services;
in
{
  imports = map (name: ./. + "/${name}.nix") services;
}
