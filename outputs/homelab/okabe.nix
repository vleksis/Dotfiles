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
    ../../hardware/asus-rog-strix-g614ji/nvidia.nix
    ../../modules/system/nixos
    ../../users/admin
    ../../homelab/nixos
    ../../homelab/nixos/python.nix
    ../../homelab/nixos/services/media.nix
    ../../homelab/nixos/services/torrent-vpn.nix

    home-manager.nixosModules.home-manager
    sops-nix.nixosModules.sops

    {
      networking.hostName = "okabe";
      system.stateVersion = "26.05";

      # Keep SSH sessions and  jobs running with the lid closed.
      services.logind.settings.Login = {
        HandleLidSwitch = "ignore";
        HandleLidSwitchExternalPower = "ignore";
        HandleLidSwitchDocked = "ignore";
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = { inherit inventory; };
      };
    }
  ];
}
