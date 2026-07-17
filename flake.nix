{
  description = "NixOS and nix-darwin configurations";

  nixConfig = {
    extra-substituters = [
      "https://noctalia.cachix.org"
    ];

    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      home-manager,
      noctalia,
      ...
    }:
    let
      system = "x86_64-linux";
      macSystem = "aarch64-darwin";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      formatter.${macSystem} = nixpkgs.legacyPackages.${macSystem}.nixfmt-tree;

      nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/laptop/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.backupFileExtension = "backup";

            home-manager.users.vleksis = {
              imports = [
                noctalia.homeModules.default
                ./home/vleksis
              ];
            };
          }
        ];
      };

      darwinConfigurations.macbook = nix-darwin.lib.darwinSystem {
        modules = [
          ./hosts/macbook/configuration.nix

          home-manager.darwinModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.backupFileExtension = "backup";

            home-manager.users.vleksis = {
              imports = [
                ./home/vleksis/darwin.nix
              ];
            };
          }
        ];
      };
    };
}
