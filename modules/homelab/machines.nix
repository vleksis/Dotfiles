{
  domain = "home.arpa";

  machines = {
    homelab = {
      address = "192.168.31.200";

      services = {
        adguard = {
          port = 3000;
        };

        caddy = {
          port = 80;
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
      address = "192.168.31.200";
      port = 3000;
    };

    jellyfin = {
      machine = "homelab";
      address = "192.168.31.200";
      port = 8096;
    };
  };

}
