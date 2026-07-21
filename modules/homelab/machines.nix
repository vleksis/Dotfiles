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

        homepage = {
          port = 8082;
        };

        ssh = {
          port = 22;
        };
      };
    };
  };

  services = {
    adguard = {
      machine = "homelab";
      address = "192.168.31.200";
      port = 3000;
      domain = "http://adguard.home.arpa";
    };

    jellyfin = {
      machine = "homelab";
      address = "192.168.31.200";
      port = 8096;
      domain = "http://jellyfin.home.arpa";
    };

    homepage = {
      machine = "homelab";
      address = "192.168.31.200";
      port = 8082;
      domain = "http://homepage.home.arpa";
    };
  };

}
