inputs:

let
  inherit (inputs) nixpkgs;

  inventory = import ../homelab/inventory;
  outputInputs = inputs // {
    inherit inventory;
  };

  systems = [
    "aarch64-darwin"
    "aarch64-linux"
    "x86_64-linux"
  ];
in
{
  formatter = nixpkgs.lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

  devShells = nixpkgs.lib.genAttrs systems (
    system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          just
          actionlint
          git
          gitleaks
          statix
          deadnix
        ];
      };
    }
  );

  darwinConfigurations = {
    eren = import ./personal/eren.nix outputInputs;
  };

  nixosConfigurations = {
    daru = import ./homelab/daru.nix outputInputs;
    mikasa = import ./personal/mikasa.nix outputInputs;
    okabe = import ./homelab/okabe.nix outputInputs;
  };
}
