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
      ../../hosts/mikasa
      ../../hosts/mikasa/desktop-hardware.nix
      ../../hosts/mikasa/nvidia.nix
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
