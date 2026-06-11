{ ... }:

{
  services.fwupd.enable = true;
  services.fstrim.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  services.asusd.enable = true;

  systemd.tmpfiles.rules = [
    "d /etc/asusd 0755 root root -"
  ];

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
