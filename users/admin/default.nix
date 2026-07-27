{
  config,
  pkgs,
  ...
}:

let
  homeDirectory = "/home/admin";
in
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
    home = homeDirectory;
    extraGroups = [
      "media"
      "wheel"
    ];
    shell = pkgs.fish;

    openssh.authorizedKeys.keyFiles = [
      ./authorized_keys
    ];
  };

  home-manager.users.admin = {
    imports = [
      ../../modules/home-manager/shared/core/fish.nix
      ../../modules/home-manager/shared/core/git.nix
      ../../modules/home-manager/shared/editors/helix.nix
      ../../modules/home-manager/shared/development/just.nix
      ../../modules/home-manager/shared/development/nix.nix
    ];

    home = {
      username = "admin";
      inherit homeDirectory;
      stateVersion = "26.05";

      packages = with pkgs; [
        btop
        curl
        dig
        markdown-oxide
        wget
      ];

      sessionVariables = {
        NIX_HOST = config.networking.hostName;

        EDITOR = "hx";
        VISUAL = "hx";
      };
    };

    programs.home-manager.enable = true;
  };
}
