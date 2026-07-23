inputs:

let
  inherit (inputs) nixpkgs;

  inventory = import ../modules/homelab/inventory.nix;
  outputInputs = inputs // {
    inherit inventory;
  };

  aarch64-darwin = import ./aarch64-darwin outputInputs;
  x86_64-linux = import ./x86_64-linux outputInputs;

  systems = [
    "aarch64-darwin"
    "x86_64-linux"
  ];
in
{
  formatter = nixpkgs.lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

  inherit (aarch64-darwin) darwinConfigurations;
  inherit (x86_64-linux) nixosConfigurations;
}
