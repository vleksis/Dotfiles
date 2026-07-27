{
  nixpkgs,
  home-manager,
  inventory,
  sops-nix,
  ...
}:

nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inventory;
    hostName = "okabe";
    nodeName = "okabe";
  };

  modules = [
    ../../hardware/asus-rog-strix-g614ji
    ../../modules/nixos/core
    ../../modules/nixos/users/admin.nix
    ../../homelab/nixos

    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops

    {
      system.stateVersion = "26.05";

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
}
