{
  nix-darwin,
  home-manager,
  nixpkgs,
  ...
}:

let
  system = "aarch64-darwin";
  hostName = "macbook";
in
{
  formatter = nixpkgs.legacyPackages.${system}.nixfmt-tree;

  darwinConfigurations.${hostName} = nix-darwin.lib.darwinSystem {
    modules = [
      ../../hosts/${hostName}/configuration.nix

      home-manager.darwinModules.home-manager

      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.extraSpecialArgs = { inherit hostName; };

        home-manager.users.vleksis.imports = [
          ../../home/vleksis/profiles/darwin.nix
        ];
      }
    ];
  };
}
