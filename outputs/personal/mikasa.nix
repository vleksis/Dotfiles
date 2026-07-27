{
  nixpkgs,
  home-manager,
  inventory,
  noctalia,
  ...
}:

nixpkgs.lib.nixosSystem {
  specialArgs.hostName = "mikasa";

  modules = [
    ../../hardware/asus-rog-strix-g614ji
    ../../hardware/asus-rog-strix-g614ji/desktop-hardware.nix
    ../../hardware/asus-rog-strix-g614ji/nvidia.nix
    ../../modules/nixos/roles/personal-desktop.nix

    home-manager.nixosModules.home-manager

    {
      system.stateVersion = "26.05";

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
}
