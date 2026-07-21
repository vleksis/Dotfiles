{ hostName, ... }:

let
  homelab = import ../machines.nix;
  services = homelab.machines.${hostName}.services;
in
{
  imports = map (name: ./. + "/${name}.nix") (builtins.attrNames services);
}
