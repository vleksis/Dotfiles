_:

{
  services.asusd.enable = true;

  systemd.tmpfiles.rules = [
    "d /etc/asusd 0755 root root -"
  ];
}
