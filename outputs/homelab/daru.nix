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
    nodeName = "daru";
  };

  modules = [
    ../../hardware/raspberry-pi-4-model-b
    ../../modules/system/nixos
    ../../users/admin
    ../../homelab/nixos

    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops

    {
      networking.hostName = "daru";
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
