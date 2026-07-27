{
  nix-darwin,
  home-manager,
  inventory,
  ...
}:

nix-darwin.lib.darwinSystem {
  specialArgs.hostName = "eren";

  modules = [
    ../../hardware/macbook-air-m4/configuration.nix

    home-manager.darwinModules.home-manager

    {
      system.stateVersion = 6;

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = { inherit inventory; };

        users.vleksis.imports = [
          ../../home/vleksis/profiles/darwin.nix
        ];
      };
    }
  ];
}
