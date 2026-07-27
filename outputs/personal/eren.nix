{
  nix-darwin,
  home-manager,
  inventory,
  ...
}:

nix-darwin.lib.darwinSystem {
  modules = [
    ../../hardware/macbook-air-m4
    ../../modules/system/darwin
    ../../users/vleksis/darwin

    home-manager.darwinModules.home-manager

    {
      networking.hostName = "eren";
      system.stateVersion = 6;

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = { inherit inventory; };
      };
    }
  ];
}
