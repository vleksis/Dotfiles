{ config, pkgs, ... }:

{
  programs.nix-ld.enable = true;

  home-manager.users.admin.home = {
    packages = [
      pkgs.python313
      pkgs.uv
    ];

    # Nix Python uses its own loader; pip wheels still need these shared libraries.
    sessionVariables.LD_LIBRARY_PATH = "/run/opengl-driver/lib:${config.environment.sessionVariables.NIX_LD_LIBRARY_PATH}";
  };
}
