{
  nixpkgs,
  home-manager,
  ...
}:

let
  hostName = "homelab";
in
{
  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit hostName; };

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
            ../../home/vleksis/profiles/homelab.nix
          ];
        };
      }
    ];
  };
}
