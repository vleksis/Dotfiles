{ lib, ... }:

let
  mountPoint = "/private/var/run/screenshot-tmpfs";
  retentionDays = 7;
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

      launchd.agents.screenshot-cleanup = {
        enable = true;
        config = {
          ProgramArguments = [
            "/bin/sh"
            "${../../../scripts/clean-screenshot-tmpfs.sh}"
            mountPoint
            (toString (retentionDays * 24 * 60))
          ];
          StartCalendarInterval = [ { Minute = 0; } ];
        };
      };

      home.activation.screenshotLocation = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
        run /usr/bin/defaults write com.apple.screencapture location -string ${lib.escapeShellArg mountPoint}
      '';
    };
}
