inputs:

let
  inherit (inputs) nixpkgs;

  inventory = import ../homelab/inventory;
  outputInputs = inputs // {
    inherit inventory;
  };

  systems = [
    "aarch64-darwin"
    "x86_64-linux"
  ];
in
{
  formatter = nixpkgs.lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

  darwinConfigurations = {
    eren = import ./personal/eren.nix outputInputs;
  };

  nixosConfigurations = {
    mikasa = import ./personal/mikasa.nix outputInputs;
    okabe = import ./homelab/okabe.nix outputInputs;
  };
}
