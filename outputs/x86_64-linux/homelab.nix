{
  nixpkgs,
  home-manager,
  ...
}:

let
  hostName = "homelab";
  inventory = import ../../modules/homelab/inventory.nix;
in
{
  nixosConfigurations.${hostName} = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit hostName inventory; };

    modules = [
      ../../hosts/laptop
      ../../modules/nixos/roles/homelab.nix

      home-manager.nixosModules.home-manager

      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";

          users.vleksis.imports = [
            ../../home/vleksis/profiles/homelab.nix
          ];
        };
      }
    ];
  };
}
