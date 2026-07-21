{
  machines = {
    homelab = {
      address = "192.168.31.187";

      services = {
        adguard = {
          port = 3000;
        };

        jellyfin = {
          port = 8096;
        };
      };
    };
  };

  services = {
    adguard = {
      machine = "homelab";
      address = "192.168.31.187";
      port = 3000;
    };

    jellyfin = {
      machine = "homelab";
      address = "192.168.31.187";
      port = 8096;
    };
  };

}
