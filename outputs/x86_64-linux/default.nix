{
  nixpkgs,
  ...
}@inputs:

let
  hosts = [
    (import ./okabe.nix inputs)
    (import ./laptop.nix inputs)
  ];
in
{
  nixosConfigurations = nixpkgs.lib.attrsets.mergeAttrsList (
    map (host: host.nixosConfigurations) hosts
  );
}
