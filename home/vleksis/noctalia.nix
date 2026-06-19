{ ... }:

{
  programs.noctalia = {
    enable = true;

    # Use Niri autostart instead:
    # spawn-at-startup "noctalia"
    systemd.enable = false;

    settings = {
      bar.default = {
        capsule = true;
        margin_ends = 20;
        thickness = 30;

        center = [
          "group:g4"
          "workspaces"
        ];

        end = [
          "tray"
          "group:g3"
          "keyboard_layout"
          "group:g5"
          "spacer_1"
          "session"
        ];

        start = [
          "group:g2"
          "group:g1"
          "media"
        ];

        capsule_group = [
          {
            fill = "surface_variant";
            id = "g1";
            members = [
              "cpu"
              "network_rx"
              "network_tx"
              "ram"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g2";
            members = [
              "clock"
              "weather"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g3";
            members = [
              "battery"
              "brightness"
              "output_volume"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g4";
            members = [
              "notifications"
              "wallpaper"
              "control-center"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
          {
            fill = "surface_variant";
            id = "g5";
            members = [
              "bluetooth"
              "network"
            ];
            opacity = 1.0;
            padding = 6.0;
          }
        ];
      };

      brightness = {
        minimum_brightness = 0.01;
      };

      calendar = {
        enabled = true;
      };

      control_center = {
        sidebar = "full";
        sidebar_section = "full";
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        pre_action_fade_seconds = 5;

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };

          "lock-and-suspend" = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900;
          };

          "screen-off" = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
          };
        };
      };

      location = {
        address = "Moscow";
      };

      lockscreen = {
        fingerprint = false;
      };

      nightlight = {
        enabled = true;
      };

      osd = {
        background_opacity = 0.9;
      };

      shell = {
        password_style = "random";
        settings_show_advanced = true;

        panel = {
          session_placement = "centered";
        };
      };

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "faithful";

        templates = {
          builtin_ids = [
            "alacritty"
            "btop"
            "cava"
            "gtk3"
            "gtk4"
            "ghostty"
            "helix"
            "kitty"
            "niri"
            "qt"
            "starship"
          ];

          community_ids = [
            "spicetify"
            "tauon"
            "zen-browser"
            "neovim"
            "vscode"
            "zed"
            "fuzzel"
            "rofi"
            "discord"
            "papirus-icons"
            "steam"
            "telegram"
            "yazi"
            "zathura"
            "hyprtoolkit"
          ];
        };
      };

      wallpaper.automation.enabled = true;

      widget = {
        battery = {
          hide_when_full = true;
          hide_when_plugged = true;
        };

        bluetooth = {
          show_label = true;
        };

        clock = {
          format = "{:%H:%M %a, %b %d}";
        };

        cpu = {
          show_label = false;
        };

        media = {
          max_length = 300;
          title_scroll = "on_hover";
        };

        network_rx = {
          show_label = false;
        };

        network_tx = {
          show_label = false;
        };

        ram = {
          show_label = false;
        };

        session = {
          capsule_padding = 18.0;
        };

        spacer_1 = {
          length = 50;
          type = "spacer";
        };

      };
    };
  };
}
