{
  nixpkgs,
  home-manager,
  inventory,
  sops-nix,
  ...
}:

let
  hostName = "okabe";
in
{
  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit hostName inventory; };

    modules = [
      ../../hardware/asus-rog-strix-g614ji
      ../../modules/nixos/roles/homelab.nix

      home-manager.nixosModules.home-manager
      sops-nix.nixosModules.sops

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
