{ hostName, ... }:

let
  machines = import ../machines.nix;
  services = machines.${hostName}.services;
in
{
  imports = map (name: ./. + "/${name}.nix") services;
}
