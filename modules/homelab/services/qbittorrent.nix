{
  inventory,
  lib,
  pkgs,
  ...
}:

let
  qbittorrent = inventory.services.qbittorrent;
  media = inventory.services.media;
  torrentVpn = inventory.services."torrent-vpn";
  configFile = "/var/lib/qBittorrent/qBittorrent/config/qBittorrent.conf";
  configureQbittorrent = pkgs.writeShellScript "configure-qbittorrent" ''
    if [[ ! -e ${lib.escapeShellArg configFile} ]]; then
      ${pkgs.coreutils}/bin/install -m 0600 /dev/null ${lib.escapeShellArg configFile}
    fi

    ${pkgs.crudini}/bin/crudini --set ${lib.escapeShellArg configFile} LegalNotice Accepted true
    ${pkgs.crudini}/bin/crudini --set ${lib.escapeShellArg configFile} Preferences 'Downloads\SavePath' ${lib.escapeShellArg "${media.paths.downloads}/"}
    ${pkgs.crudini}/bin/crudini --set ${lib.escapeShellArg configFile} Preferences 'WebUI\Address' '*'
    ${pkgs.crudini}/bin/crudini --set ${lib.escapeShellArg configFile} Preferences 'WebUI\ServerDomains' ${lib.escapeShellArg qbittorrent.domain}
    ${pkgs.crudini}/bin/crudini --set ${lib.escapeShellArg configFile} Preferences 'WebUI\HostHeaderValidation' true
    ${pkgs.crudini}/bin/crudini --set ${lib.escapeShellArg configFile} Preferences 'WebUI\CSRFProtection' true
    ${pkgs.crudini}/bin/crudini --set ${lib.escapeShellArg configFile} Preferences 'Connection\Interface' ${lib.escapeShellArg torrentVpn.interface}
  '';
in
{
  services.qbittorrent = {
    enable = true;
    openFirewall = false;
    group = "media";
    webuiPort = qbittorrent.port;
    extraArgs = [ "--confirm-legal-notice" ];
  };

  systemd.services.qbittorrent = {
    after = [ "wg-quick-${torrentVpn.interface}.service" ];
    bindsTo = [ "wg-quick-${torrentVpn.interface}.service" ];

    serviceConfig = {
      ExecStartPre = configureQbittorrent;
      UMask = lib.mkForce "0002";
    };
  };
}
