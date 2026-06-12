{ lib, ... }:

{
  programs.bash.enable = true;

  programs.fish = {
    enable = true;

    shellAliases = lib.mkForce { };
  };

  programs.vim.enable = true;
  programs.firefox.enable = true;

  programs.amnezia-vpn.enable = true;

  services.printing.enable = true;
}
