{
  nixpkgs,
  home-manager,
  noctalia,
  ...
}:

let
  system = "x86_64-linux";
  hostName = "laptop";
in
{
  formatter = nixpkgs.legacyPackages.${system}.nixfmt-tree;

  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
    inherit system;

    modules = [
      ../../hosts/${hostName}/configuration.nix

      home-manager.nixosModules.home-manager

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit hostName; };

          users.vleksis.imports = [
            noctalia.homeModules.default
            ../../home/vleksis/profiles/linux.nix
          ];
        };
      }
    ];
  };
}
