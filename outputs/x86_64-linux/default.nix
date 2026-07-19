{
  nixpkgs,
  ...
}@inputs:

let
  hosts = [
    (import ./laptop.nix inputs)
  ];
in
{
  nixosConfigurations = nixpkgs.lib.attrsets.mergeAttrsList (
    map (host: host.nixosConfigurations) hosts
  );
}
