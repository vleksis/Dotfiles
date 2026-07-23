{
  nixpkgs,
  ...
}@inputs:

let
  hosts = [
    (import ./okabe.nix inputs)
    (import ./mikasa.nix inputs)
  ];
in
{
  nixosConfigurations = nixpkgs.lib.attrsets.mergeAttrsList (
    map (host: host.nixosConfigurations) hosts
  );
}
