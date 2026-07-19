{
  nix-darwin,
  home-manager,
  ...
}:

let
  hostName = "macbook";
in
{
  darwinConfigurations.${hostName} = nix-darwin.lib.darwinSystem {
    modules = [
      ../../hosts/${hostName}/configuration.nix

      home-manager.darwinModules.home-manager

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit hostName; };

          users.vleksis.imports = [
            ../../home/vleksis/profiles/darwin.nix
          ];
        };
      }
    ];
  };
}
