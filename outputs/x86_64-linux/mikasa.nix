{
  nixpkgs,
  home-manager,
  inventory,
  noctalia,
  ...
}:

let
  hostName = "mikasa";
in
{
  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit hostName; };

    modules = [
      ../../hosts/asus-rog-strix-g614ji
      ../../hosts/asus-rog-strix-g614ji/desktop-hardware.nix
      ../../hosts/asus-rog-strix-g614ji/nvidia.nix
      ../../modules/nixos/roles/personal-desktop.nix

      home-manager.nixosModules.home-manager

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = { inherit inventory; };

          users.vleksis.imports = [
            noctalia.homeModules.default
            ../../home/vleksis/profiles/linux.nix
          ];
        };
      }
    ];
  };
}
