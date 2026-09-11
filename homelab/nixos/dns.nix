{
  inventory,
  lib,
  nodeName,
  ...
}:

let
  adguard = inventory.services.adguard;
in
lib.mkIf (nodeName != adguard.node) {
  networking.nameservers = [ adguard.address ];

  # Prefer the inventory DNS server over nameservers received from DHCP.
  networking.resolvconf.extraConfig = ''
    interface_order='lo lo[0-9]* static'
  '';
}
