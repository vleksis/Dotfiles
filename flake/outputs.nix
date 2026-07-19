inputs:

let
  inherit (inputs) nixpkgs;

  laptop = import ./systems/laptop.nix inputs;
  macbook = import ./systems/macbook.nix inputs;

  systems = [
    "aarch64-darwin"
    "x86_64-linux"
  ];
in
{
  formatter = nixpkgs.lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

  inherit (laptop) nixosConfigurations;
  inherit (macbook) darwinConfigurations;
}
