{ inventory, ... }:

{
  environment.etc."resolver/${inventory.topDomain}".text = ''
    nameserver ${inventory.services.adguard.address}
  '';
}
