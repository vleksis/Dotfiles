{
  nixpkgs,
  home-manager,
  noctalia,
  ...
}:

let
  hostName = "laptop";
in
{
  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
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
