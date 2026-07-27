{
  inventory,
  lib,
  pkgs,
  ...
}:

let
  torrentVpn = inventory.services."torrent-vpn";
  inherit (torrentVpn) interface;
  tunnelAddress = "10.8.1.10";
  routingTable = "51820";
  killSwitchTable = "51821";
  outerPacketMark = "51822";
  endpointAddress = "41.216.182.35";
  endpointPort = 33676;
  proxyUser = "torrent-vpn";
  firewallChain = "nixos-torrent-vpn";
  vpnUsers = [
    "qbittorrent"
    proxyUser
  ];

  addRoutingPolicy = ''
    ${pkgs.iproute2}/bin/ip rule delete priority 80 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 90 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 91 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 92 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 100 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 101 2>/dev/null || true

    ${pkgs.iproute2}/bin/ip route replace unreachable default table ${killSwitchTable}
    ${pkgs.iproute2}/bin/ip rule add priority 90 to 10.0.0.0/8 lookup main
    ${pkgs.iproute2}/bin/ip rule add priority 91 to 172.16.0.0/12 lookup main
    ${pkgs.iproute2}/bin/ip rule add priority 92 to 192.168.0.0/16 lookup main
    ${pkgs.iproute2}/bin/ip rule add priority 100 from ${tunnelAddress}/32 lookup ${routingTable}
    ${pkgs.iproute2}/bin/ip rule add priority 101 from ${tunnelAddress}/32 lookup ${killSwitchTable}
  '';

  removeRoutingPolicy = ''
    ${pkgs.iproute2}/bin/ip rule delete priority 101 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 100 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 92 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 91 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 90 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip rule delete priority 80 2>/dev/null || true
    ${pkgs.iproute2}/bin/ip route delete unreachable default table ${killSwitchTable} 2>/dev/null || true
  '';

  addFirewallJumps = lib.concatMapStringsSep "\n" (user: ''
    iptables -w -C OUTPUT -m owner --uid-owner ${user} -j ${firewallChain} 2>/dev/null \
      || iptables -w -I OUTPUT 1 -m owner --uid-owner ${user} -j ${firewallChain}
    ip6tables -w -C OUTPUT -m owner --uid-owner ${user} -j ${firewallChain} 2>/dev/null \
      || ip6tables -w -I OUTPUT 1 -m owner --uid-owner ${user} -j ${firewallChain}
  '') vpnUsers;

  removeFirewallJumps = lib.concatMapStringsSep "\n" (user: ''
    iptables -w -D OUTPUT -m owner --uid-owner ${user} -j ${firewallChain} 2>/dev/null || true
    ip6tables -w -D OUTPUT -m owner --uid-owner ${user} -j ${firewallChain} 2>/dev/null || true
  '') vpnUsers;
in
{
  users = {
    groups.${proxyUser} = { };
    users.${proxyUser} = {
      isSystemUser = true;
      group = proxyUser;
    };
  };

  systemd.tmpfiles.rules = [ "d /etc/secrets 0700 root root - -" ];

  networking = {
    wg-quick.interfaces.${interface} = {
      type = "amneziawg";
      address = [ "${tunnelAddress}/32" ];
      privateKeyFile = "/etc/secrets/amnezia-qbt-private-key";
      table = routingTable;
      mtu = 1280;

      extraOptions = {
        Jc = 4;
        Jmin = 10;
        Jmax = 50;
        S1 = 88;
        S2 = 104;
        S3 = 8;
        S4 = 19;
        H1 = "475133220-1957824259";
        H2 = "2041101486-2121364570";
        H3 = "2127846659-2136748005";
        H4 = "2147104921-2147397757";
        I1 = "<r 2><b 0x858000010001000000000669636c6f756403636f6d0000010001c00c000100010000105a00044d583737>";
      };

      # Identify encrypted outer packets so the owner-based kill switch can
      # allow only transport to the configured Amnezia endpoint.
      postUp = ''
        ${pkgs.amneziawg-tools}/bin/awg set ${interface} fwmark ${outerPacketMark}
      '';

      peers = [
        {
          publicKey = "Ki2+ViLV+xKH1jhV8czaBkTm+IqcLEPrkm51AW5ceho=";
          presharedKeyFile = "/etc/secrets/amnezia-qbt-preshared-key";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "${endpointAddress}:${toString endpointPort}";
          persistentKeepalive = 25;
        }
      ];

    };

    firewall = {
      checkReversePath = "loose";

      extraCommands = lib.mkAfter ''
        iptables -w -t mangle -D OUTPUT -m owner --uid-owner qbittorrent -j MARK --set-mark ${routingTable} 2>/dev/null || true
        iptables -w -t mangle -D OUTPUT -m owner --uid-owner ${proxyUser} -j MARK --set-mark ${routingTable} 2>/dev/null || true
        iptables -w -t mangle -D OUTPUT -m mark --mark 0 -m owner --uid-owner qbittorrent -j MARK --set-mark ${routingTable} 2>/dev/null || true
        iptables -w -t mangle -D OUTPUT -m mark --mark 0 -m owner --uid-owner ${proxyUser} -j MARK --set-mark ${routingTable} 2>/dev/null || true
        ${addRoutingPolicy}

        iptables -w -N ${firewallChain} 2>/dev/null || true
        iptables -w -F ${firewallChain}
        iptables -w -A ${firewallChain} -d 127.0.0.0/8 -j RETURN
        iptables -w -A ${firewallChain} -d 10.0.0.0/8 -j RETURN
        iptables -w -A ${firewallChain} -d 172.16.0.0/12 -j RETURN
        iptables -w -A ${firewallChain} -d 192.168.0.0/16 -j RETURN
        iptables -w -A ${firewallChain} -m mark --mark ${outerPacketMark} -p udp -d ${endpointAddress} --dport ${toString endpointPort} -j RETURN
        iptables -w -A ${firewallChain} -o ${interface} -j RETURN
        iptables -w -A ${firewallChain} -j REJECT --reject-with icmp-port-unreachable

        ip6tables -w -N ${firewallChain} 2>/dev/null || true
        ip6tables -w -F ${firewallChain}
        ip6tables -w -A ${firewallChain} -d ::1/128 -j RETURN
        ip6tables -w -A ${firewallChain} -j REJECT --reject-with icmp6-port-unreachable

        ${addFirewallJumps}
      '';

      extraStopCommands = lib.mkAfter ''
        ${removeRoutingPolicy}
        ${removeFirewallJumps}

        iptables -w -F ${firewallChain} 2>/dev/null || true
        iptables -w -X ${firewallChain} 2>/dev/null || true
        ip6tables -w -F ${firewallChain} 2>/dev/null || true
        ip6tables -w -X ${firewallChain} 2>/dev/null || true
      '';
    };
  };

  systemd.services.torrent-vpn-proxy = {
    description = "Loopback SOCKS5 proxy through the torrent VPN";
    after = [ "wg-quick-${interface}.service" ];
    bindsTo = [ "wg-quick-${interface}.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      User = proxyUser;
      Group = proxyUser;
      ExecStart = "${lib.getExe pkgs.microsocks} -i 127.0.0.1 -p ${toString torrentVpn.socksPort} -b ${tunnelAddress}";
      Restart = "on-failure";
      PrivateTmp = true;
      PrivateDevices = true;
      ProtectHome = true;
      ProtectSystem = "strict";
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
      NoNewPrivileges = true;
      RestrictAddressFamilies = [
        "AF_INET"
        "AF_INET6"
      ];
    };
  };
}
