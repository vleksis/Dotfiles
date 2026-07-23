{ pkgs, ... }:

{
  users.users.vleksis = {
    isNormalUser = true;
    description = "Vladislav Maltsev";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };
}
