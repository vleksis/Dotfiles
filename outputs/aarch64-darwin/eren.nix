{
  nix-darwin,
  home-manager,
  inventory,
  ...
}:

let
  hostName = "eren";
in
{
  darwinConfigurations.${hostName} = nix-darwin.lib.darwinSystem {
    specialArgs = { inherit hostName; };

    modules = [
      ../../hosts/${hostName}/configuration.nix

      home-manager.darwinModules.home-manager

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit inventory; };

          users.vleksis.imports = [
            ../../home/vleksis/profiles/darwin.nix
          ];
        };
      }
    ];
  };
}
