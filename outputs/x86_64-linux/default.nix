{
  nixpkgs,
  ...
}@inputs:

let
  hosts = [
    (import ./homelab.nix inputs)
    (import ./laptop.nix inputs)
  ];
in
{
  nixosConfigurations = nixpkgs.lib.attrsets.mergeAttrsList (
    map (host: host.nixosConfigurations) hosts
  );
}
