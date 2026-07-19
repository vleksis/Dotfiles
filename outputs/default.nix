inputs:

let
  inherit (inputs) nixpkgs;

  aarch64-darwin = import ./aarch64-darwin inputs;
  x86_64-linux = import ./x86_64-linux inputs;

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
