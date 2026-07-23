{ pkgs, ... }:

{
  services.displayManager.ly.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  programs.niri.enable = true;
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;

    config = {
      common.default = [
        "gnome"
        "gtk"
      ];

      niri.default = [
        "gnome"
        "gtk"
      ];
    };

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
