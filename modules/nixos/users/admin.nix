{ pkgs, ... }:

{
  security.sudo.extraRules = [
    {
      users = [ "admin" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  users.users.admin = {
    isNormalUser = true;
    description = "Homelab administrator";
    extraGroups = [
      "media"
      "wheel"
    ];
    shell = pkgs.fish;

    openssh.authorizedKeys.keyFiles = [
      ../../../home/admin/authorized_keys
    ];
  };
}
