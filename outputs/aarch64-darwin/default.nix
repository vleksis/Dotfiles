{
  nixpkgs,
  ...
}@inputs:

let
  hosts = [
    (import ./macbook.nix inputs)
  ];
in
{
  darwinConfigurations = nixpkgs.lib.attrsets.mergeAttrsList (
    map (host: host.darwinConfigurations) hosts
  );
}
