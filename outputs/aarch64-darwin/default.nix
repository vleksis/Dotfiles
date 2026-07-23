{
  nixpkgs,
  ...
}@inputs:

let
  hosts = [
    (import ./eren.nix inputs)
  ];
in
{
  darwinConfigurations = nixpkgs.lib.attrsets.mergeAttrsList (
    map (host: host.darwinConfigurations) hosts
  );
}
