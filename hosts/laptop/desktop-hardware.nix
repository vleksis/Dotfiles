_:

{
  services = {
    asusd.enable = true;

    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

  systemd.tmpfiles.rules = [
    "d /etc/asusd 0755 root root -"
  ];
}
