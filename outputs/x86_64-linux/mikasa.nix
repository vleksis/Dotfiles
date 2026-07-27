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
      ../../hardware/asus-rog-strix-g614ji
      ../../hardware/asus-rog-strix-g614ji/desktop-hardware.nix
      ../../hardware/asus-rog-strix-g614ji/nvidia.nix
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
