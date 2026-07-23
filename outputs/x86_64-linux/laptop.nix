{
  nixpkgs,
  home-manager,
  inventory,
  noctalia,
  ...
}:

let
  hostName = "laptop";
in
{
  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit hostName; };

    modules = [
      ../../hosts/laptop
      ../../hosts/laptop/desktop-hardware.nix
      ../../hosts/laptop/nvidia.nix
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
