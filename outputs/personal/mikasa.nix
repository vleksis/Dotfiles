{
  nixpkgs,
  home-manager,
  inventory,
  noctalia,
  ...
}:

nixpkgs.lib.nixosSystem {
  modules = [
    ../../hardware/asus-rog-strix-g614ji
    ../../hardware/asus-rog-strix-g614ji/desktop.nix
    ../../hardware/asus-rog-strix-g614ji/nvidia.nix
    ../../modules/system/nixos
    ../../modules/system/nixos/desktop
    ../../users/vleksis/nixos

    home-manager.nixosModules.home-manager

    {
      networking.hostName = "mikasa";
      system.stateVersion = "26.05";

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = { inherit inventory; };
        sharedModules = [
          noctalia.homeModules.default
        ];
      };
    }
  ];
}
