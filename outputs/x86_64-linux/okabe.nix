{
  nixpkgs,
  home-manager,
  inventory,
  ...
}:

let
  hostName = "okabe";
in
{
  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit hostName inventory; };

    modules = [
      ../../hosts/mikasa
      ../../modules/nixos/roles/homelab.nix

      home-manager.nixosModules.home-manager

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit inventory; };

          users.admin.imports = [
            ../../home/admin
          ];
        };
      }
    ];
  };
}
