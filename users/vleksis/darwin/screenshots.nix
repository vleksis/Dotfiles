{ lib, ... }:

let
  mountPoint = "/private/var/run/screenshot-tmpfs";
in
{
  launchd.daemons.screenshot-tmpfs = {
    serviceConfig.RunAtLoad = true;

    command = "/bin/sh ${../../../scripts/mount-screenshot-tmpfs.sh} ${lib.escapeShellArg mountPoint} vleksis";
  };

  home-manager.users.vleksis =
    { config, lib, ... }:
    {
      home.file."Desktop/Screenshots".source = config.lib.file.mkOutOfStoreSymlink mountPoint;

      home.activation.screenshotLocation = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
        run /usr/bin/defaults write com.apple.screencapture location -string ${lib.escapeShellArg mountPoint}
      '';
    };
}
