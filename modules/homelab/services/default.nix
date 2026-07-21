{ hostName, inventory, ... }:

let
  services = inventory.machines.${hostName}.services;
in
{
  imports = map (name: ./. + "/${name}.nix") services;
}
