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
    nodeName = "okabe";
  };

  modules = [
    ../../hardware/asus-rog-strix-g614ji
    ../../modules/system/nixos
    ../../users/admin
    ../../homelab/nixos

    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops

    {
      networking.hostName = "okabe";
      system.stateVersion = "26.05";

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = { inherit inventory; };
      };
    }
  ];
}
