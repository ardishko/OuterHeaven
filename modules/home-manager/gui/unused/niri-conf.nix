{
  config,
  osConfig,
  pkgs,
  inputs,
  lib,
  ...
}:
let
  username = osConfig.users.users.${config.home.username}.description;
in
{
  imports = [ inputs.niri-nix.homeModules.default ];
  home.packages = with pkgs; [
    xwayland-satellite
  ];
  wayland.windowManager.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      output =
        if (username == "vaporsnake") then
          [
            {
              _args = [ "DP-2" ];
              mode = "2560x1440@164.998993";
              scale = 1.0;
              position._props = {
                x = 0;
                y = 0;
              };
            }
          ]
        else if (username == "liquid") then
          [
            {
              _args = [ "eDP-1" ];
              mode = "1920x1200@164.998993";
              scale = 1.0;
              position._props = {
                x = 0;
                y = 0;
              };
            }
          ]
        else
          [ ];
      input = {
        keyboard.xkb = {
          layout = "tr,lv,se";
          options = "grp:rctrl_toggle";
        };
        focus-follows-mouse = [ ];
        touchpad = {
          natural-scroll = [ ];
          scroll-factor = 2.0;
          accel-profile = "adaptive";
        };
        mouse = {
          accel-profile = "adaptive";
        };
      };
      cursor = {
        xcursor-theme = config.home.pointerCursor.name;
        xcursor-size = 26;
      };
      layout = {
        gaps = 20;
        focus-ring = {
          width = 2;
          active-color = "#99D1DB";
          inactive-color = "#4d4d4d";
        };
      };
      workspace =
        if (username == "vaporsnake") then
          map (n: {
            _args = [ (toString n) ];
            open-on-output._args = [ "DP-2" ];
          }) (lib.range 1 10)
        else if (username == "liquid") then
          map (n: {
            _args = [ (toString n) ];
            open-on-output._args = [ "eDP-1" ];
          }) (lib.range 1 10)
        else
          [ ];
      spawn-at-startup = [
        [ "mullvad-gui" ]
        [ "discover-overlay" ]
        [ "flameshot" ]
        [
          "obs"
          "--startreplaybuffer"
          "--disable-shutdown-check"
        ]
        [
          "mpv"
          "--playlist=/home/${username}/Music/MainMenu"
          "--no-video"
          "--shuffle"
          "--volume=22"
        ]
        [ "${pkgs.thunderbird}/bin/thunderbird" ]
        [
          "${pkgs.element-desktop}/bin/element-desktop"
          "--hidden"
        ]
        [
          "${pkgs.mullvad}/bin/mullvad-exclude"
          "${pkgs.signal-desktop}/bin/signal-desktop"
          "--no-sandbox"
          "--start-in-tray"
        ]
        [ "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1" ]
        [
          "${pkgs.wl-clipboard}/bin/wl-paste"
          "--watch"
          "${pkgs.cliphist}/bin/cliphist"
          "store"
        ]
      ]
      ++ (lib.lists.optionals (username == "vaporsnake") [
        [
          "${pkgs.swaybg}/bin/swaybg"
          "--o"
          "DP-2"
          "-i"
          "${../../../assets/wallpapers/strawHats.png}"
        ]
        [
          "${pkgs.swaybg}/bin/swaybg"
          "--o"
          "HDMI-A-1"
          "-i"
          "${../../../assets/wallpapers/mark-of-sacrifice-vertical.png}"
        ]
      ])
      ++ (lib.lists.optionals (username == "liquid") [
        [
          "${pkgs.swaybg}/bin/swaybg"
          "--o"
          "eDP-1"
          "-i"
          "${../../../assets/wallpapers/berserk-catppuccin.png}"
        ]
      ]);

      binds = {
        "Mod+Return".spawn = [ "ghostty" ];
        "Alt+F4".close-window = [ ];
        "Mod+Shift+W".close-window = [ ];
        "Mod+Shift+Delete".quit = [ ];
        "Mod+A".toggle-window-floating = [ ];
        "Mod+F".fullscreen-window = [ ];
        "Mod+S".maximize-column = [ ];

        "Ctrl+Escape".spawn = [
          "dms"
          "ipc"
          "spotlight"
          "toggle"
        ];

        "Print".spawn = [
          "sh"
          "-c"
          "${pkgs.flameshot}/bin/flameshot gui -r | ${pkgs.wl-clipboard}/bin/wl-copy | ${pkgs.wl-clipboard}/bin/wl-paste | ${
            inputs.shadower.packages.${pkgs.system}.shadower
          }/bin/shadower | ${pkgs.wl-clipboard}/bin/wl-paste"
        ];
        "Ctrl+Print".spawn = [
          "${pkgs.flameshot}/bin/flameshot"
          "gui"
        ];

        "Mod+E".focus-workspace-down = [ ];
        "Mod+Q".focus-workspace-up = [ ];
        "Super+Alt+L".spawn = [
          "dms"
          "ipc"
          "lock"
          "lock"
        ];
        "Mod+M".spawn = [
          "dms"
          "ipc"
          "processlist"
          "toggle"
        ];
        "Mod+V".spawn = [
          "dms"
          "ipc"
          "clipboard"
          "toggle"
        ];

        "Mod+Left".focus-column-left = [ ];
        "Mod+Right".focus-column-right = [ ];
        "Mod+Up".focus-window-up = [ ];
        "Mod+Down".focus-window-down = [ ];

        "Pause".spawn = [
          "${pkgs.playerctl}/bin/playerctl"
          "play-pause"
        ];

        "Mod+quotedbl".spawn = [
          "${pkgs.libnotify}/bin/notify-send"
          "Recording saved"
          "check /home/${username}/Videos"
        ];

        "Mod+1".focus-workspace = "1";
        "Mod+2".focus-workspace = "2";
        "Mod+3".focus-workspace = "3";
        "Mod+4".focus-workspace = "4";
        "Mod+5".focus-workspace = "5";
        "Mod+6".focus-workspace = "6";
        "Mod+7".focus-workspace = "7";
        "Mod+8".focus-workspace = "8";
        "Mod+9".focus-workspace = "9";
        "Mod+0".focus-workspace = "10";

        "Mod+Shift+1".move-window-to-workspace = "1";
        "Mod+Shift+2".move-window-to-workspace = "2";
        "Mod+Shift+3".move-window-to-workspace = "3";
        "Mod+Shift+4".move-window-to-workspace = "4";
        "Mod+Shift+5".move-window-to-workspace = "5";
        "Mod+Shift+6".move-window-to-workspace = "6";
        "Mod+Shift+7".move-window-to-workspace = "7";
        "Mod+Shift+8".move-window-to-workspace = "8";
        "Mod+Shift+9".move-window-to-workspace = "9";
        "Mod+Shift+0".move-window-to-workspace = "10";

        "Mod+Shift+Left".move-column-left = [ ];
        "Mod+Shift+Right".move-column-right = [ ];
        "Mod+Shift+Up".move-window-up = [ ];
        "Mod+Shift+Down".move-window-down = [ ];

        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-workspace-up = [ ];
        };
        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-workspace-down = [ ];
        };
      };

      window-rule = [
        {
          match._props.app-id = "org.prismlauncher.PrismLauncher";
          draw-border-with-background = false;
        }
        {
          geometry-corner-radius = 12;
          clip-to-geometry = true;
        }
        {
          match._props.app-id._raw = ''r#"^steam_app"#'';
          variable-refresh-rate = true;
        }
        {
          match._props.app-id = "osu!";
          variable-refresh-rate = true;
        }
        {
          match._props.app-id = "org.vinegarhq.Sober";
          variable-refresh-rate = true;
        }
        {
          match._props.app-id = "flameshot";
          open-floating = true;
        }
        {
          match._props.title = "wlogout";
          open-floating = true;
        }
        {
          match._props.title = "Discord Popout";
          open-floating = true;
          opacity = 0.5;
        }
        {
          match._props.title = "Picture-in-Picture";
          open-floating = true;
          opacity = 0.5;
        }
        {
          match._props.title = "MainPicker";
          open-floating = true;
        }

        {
          match._props.app-id = "firefox";
          open-on-workspace = "1";
        }
        {
          match._props.app-id = "discord";
          open-on-workspace = "2";
        }
        {
          match._props.app-id = "vesktop";
          open-on-workspace = "2";
        }
        {
          match._props.app-id = "Signal Beta";
          open-on-workspace = "2";
        }
        {
          match._props.app-id = "Element";
          open-on-workspace = "2";
        }
        {
          match._props.app-id = "soundux";
          open-on-workspace = "2";
        }
        {
          match._props.title = "Steam";
          open-on-workspace = "3";
        }
        {
          match._props.app-id = "steam";
          open-on-workspace = "3";
        }
        {
          match._props.app-id = "org.prismlauncher.PrismLauncher";
          open-on-workspace = "3";
        }
        {
          match._props.app-id = "thunderbird";
          open-on-workspace = "4";
        }
        {
          match._props.app-id = "electron-mail";
          open-on-workspace = "4";
        }
        {
          match._props.title = "nvim";
          open-on-workspace = "5";
        }
        {
          match._props.app-id._raw = ''r#"^libreoffice"#'';
          open-on-workspace = "6";
        }
        {
          match._props.app-id = "krita";
          open-on-workspace = "6";
        }
        {
          match._props.app-id = ".gimp-2.10-wrapped_";
          open-on-workspace = "6";
        }
        {
          match._props.app-id = "mpv";
          open-on-workspace = "7";
        }
        {
          match._props.app-id = "info.febvre.Komikku";
          open-on-workspace = "7";
        }
        {
          match._props.app-id = "Upscayl";
          open-on-workspace = "7";
        }
        {
          match._props.app-id = "obsidian";
          open-on-workspace = "7";
        }
        {
          match._props.app-id = "com.obsproject.Studio";
          open-on-workspace = "8";
        }
        {
          match._props.app-id = "Waydroid";
          open-on-workspace = "9";
        }
        {
          match._props.app-id = "org.vinegarhq.Sober";
          open-on-workspace = "10";
        }
        {
          match._props.app-id = "osu!";
          open-on-workspace = "10";
        }
        {
          match._props.app-id._raw = ''r#"^steam_app"#'';
          open-on-workspace = "10";
        }
      ];
    };

    extraConfig = "";
  };
}
