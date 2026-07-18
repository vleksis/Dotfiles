{ lib, ... }:

{
  programs = {
    bash.enable = true;
    fish.enable = true;

    vim.enable = true;
    firefox.enable = true;

    amnezia-vpn.enable = true;
  };

  environment.shellAliases = lib.mkForce { };

  services.printing.enable = true;
}
