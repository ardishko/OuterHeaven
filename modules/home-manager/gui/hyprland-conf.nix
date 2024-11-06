{
  pkgs,
  inputs,
  lib,
  hostname,
  username,
  ...
}:
{
  # balls
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd = {
      enable = true;
      variables = [
        "DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
    };
    xwayland.enable = true;
    plugins = [
      # inputs.hy3.packages.${pkgs.system}.hy3
      # inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      pkgs.hyprlandPlugins.csgo-vulkan-fix
      pkgs.hyprlandPlugins.hyprbars
      pkgs.hyprlandPlugins.hyprexpo
    ];
    settings = {
      "$mainMod" = "SUPER";
      "general:layout" = "dwindle";
      monitor =
        if (hostname == "ShadowMoses") then
          [
            "DP-2,2560x1440@164.998993, 0x350, 1"
            "HDMI-A-1,1920x1080,2560x0, 1, transform, 3"
          ]
        else if (hostname == "BigShell") then
          [ "eDP-1,1920x1200@60.001999, 0x0, 1" ]
        else
          [ ];
      exec-once =
        [
          "mullvad-gui"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "hyprctl setcursor macOS 24"
          "discover-overlay"
          "flameshot"
          "sleep 0.5 && ags"
          "obs --startreplaybuffer"
          "${pkgs.wlsunset}/bin/wlsunset"
          "${pkgs.swaynotificationcenter}/bin/swaync"
          "${pkgs.swayidle}/bin/swayidle -C ~/.config/swayidle/config"
          "${pkgs.swayosd}/bin/swayosd-server"
          "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1"
          "${pkgs.hypridle}/bin/hypridle"
          # "${pkgs.wl-clipboard}/bin/wl-copy --type image --watch ${pkgs.cliphist}/bin/cliphist store"
          # "${pkgs.wl-clipboard}/bin/wl-copy --type text --watch ${pkgs.cliphist}/bin/cliphist store"
          "${pkgs.arrpc}/bin/arrpc"
          "${pkgs.premid}/bin/premid --in-process-gpu"
        ]
        ++ (lib.lists.optionals (hostname == "ShadowMoses") [
          "${pkgs.swaybg}/bin/swaybg --o DP-2 -i ${../../../assets/wallpapers/strawHats.png}"
          "${pkgs.swaybg}/bin/swaybg --o HDMI-A-1 -i ${../../../assets/wallpapers/mark-of-sacrifice-vertical.png}"
          "${pkgs.noisetorch}/bin/noisetorch -i alsa_input.usb-IK_Multimedia_iRig_Mic_HD_2_N_A-00.mono-fallback"
        ])
        ++ (lib.lists.optionals (hostname == "BigShell") [
          "${pkgs.swaybg}/bin/swaybg --o eDP-1 -i ${../../../assets/wallpapers/berserk-catppuccin.png}"
        ]);
      workspace =
        if (hostname == "ShadowMoses") then
          [
            "1,monitor:DP-2"
            "2,monitor:DP-2"
            "3,monitor:DP-2"
            "4,monitor:DP-2"
            "5,monitor:DP-2"
            "6,monitor:DP-2"
            "7,monitor:DP-2"
            "8,monitor:DP-2"
            "9,monitor:DP-2"
            "10,monitor:DP-2"
            "11,monitor:HDMI-A-1"
            "12,monitor:HDMI-A-1"
            "13,monitor:HDMI-A-1"
            "14,monitor:HDMI-A-1"
          ]
        else if (hostname == "BigShell") then
          [
            "1,monitor:eDP-1"
            "2,monitor:eDP-1"
            "3,monitor:eDP-1"
            "4,monitor:eDP-1"
            "5,monitor:eDP-1"
            "6,monitor:eDP-1"
            "7,monitor:eDP-1"
            "8,monitor:eDP-1"
            "9,monitor:eDP-1"
            "10,monitor:eDP-1"
          ]
        else
          [ ];
      bind =
        [
          "$mainMod, Return, exec, kitty"
          "SUPER_SHIFT, W, killactive,"
          "SUPER_SHIFT, Del, exec, pkill Hyprland"
          "$mainMod, A, togglefloating,"
          "CTRL, Escape, exec, ${inputs.anyrun.packages.${pkgs.system}.anyrun}/bin/anyrun"
          "$mainMod, E, togglesplit, # dwindle"
          "$mainMod,F,fullscreen"
          '',Print, exec, ${
            inputs.wayfreeze.packages.${pkgs.system}.wayfreeze
          }/bin/wayfreeze --hide-cursor & PID=$!; sleep .1; ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${
            inputs.shadower.packages.${pkgs.system}.shadower
          }/bin/shadower | ${pkgs.wl-clipboard}/bin/wl-copy; kill $PID''
          "$mainMod, Tab, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t"
          "Alt_L, E, exec, hyprctl dispatch workspace +1"
          "Alt_L, Q, exec, hyprctl dispatch workspace -1"
          "Alt_L, Tab, hyprexpo:expo, toggle"
          # "$mainMod, T, exec, ${inputs.hyprcontrib.packages.${pkgs.system}.hdrop}/bin/hdrop ${pkgs.kitty}/bin/kitty --class dropdown-kitty"
          # "$mainMod, V, exec, ${pkgs.cliphist}/bin/cliphist list | ${pkgs.wofi}/bin/wofi --dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy"
          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "Alt_L, Tab, exec, sleep 0.1 && hyprswitch --daemon --ignore-monitors --switch-ws-on-hover"
          "Alt_L, quotedbl, exec, hyprswitch --stop-daemon"
          "$mainMod, quotedbl, exec, ${pkgs.libnotify}/bin/notify-send 'Recording saved' 'check /home/${username}/Videos'"
          ",XF86AudioPlay, exec, "
          #i3/sway type beat

          ",Caps_Lock, exec, sleep 0.1 && ${pkgs.swayosd}/bin/swayosd-client --caps-lock"
          "$mainMod, Q, togglegroup"
          "$mainMod, D, changegroupactive"
          "$mainMod, W, lockgroups, toggle"

          #global shortcuts
          "SUPER,F10,pass,^(com\.obsproject\.Studio)$"
          "SUPER,F9,pass,^(com\.obsproject\.Studio)$"
          "SUPER,F4,pass,^(com\.obsproject\.Studio)$"
          "$mainMod, quotedbl,pass,^(com.obsproject.Studio)"
          "$mainMod, Insert,pass,^(discordcanary)$"
          "$mainMod, Home,pass,^(discordcanary)$"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
          "$mainMod, minus, movetoworkspace, special:scratchpad"
          # Move window with mainMod_SHIFT + arrow keys
          "$mainMod SHIFT, left, movewindow, l"
          "$mainMod SHIFT, right, movewindow, r"
          "$mainMod SHIFT, up, movewindow, u"
          "$mainMod SHIFT, down, movewindow, d"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_up, workspace, r+1"
          "$mainMod, mouse_down, workspace, r-1"
        ]
        ++ (lib.lists.optionals (hostname == "ShadowMoses") [
          "$mainMod, h, workspace, 11"
          "$mainMod, j, workspace, 12"
          "$mainMod, k, workspace, 13"
          "$mainMod, l, workspace, 14"
          # Move to active window workspaces, for HJKL workspaces with SUPER + SHIFT + [h,j,k,l]
          "$mainMod SHIFT, h, movetoworkspacesilent, 11"
          "$mainMod SHIFT, j, movetoworkspacesilent, 12"
          "$mainMod SHIFT, k, movetoworkspacesilent, 13"
          "$mainMod SHIFT, l, movetoworkspacesilent, 14"
        ]);
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindrn = [
        "Alt_L, Tab, exec, hyprswitch --daemon --ignore-monitors --switch-ws-on-hover || hyprswitch --stop-daemon"
        "SUPER, SUPER_L, exec, pkill wofi || ${pkgs.wofi}/bin/wofi"
      ];
      input = {
        kb_layout = "tr,us,lv";
        kb_options = "grp:rctrl_toggle";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
        touchdevice = {
          transform = 1;
        };
        float_switch_override_focus = 2;
        # scroll_factor = 2.0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgb(99D1DB)";
        layout = "dwindle";
        resize_on_border = true;
      };
      decoration = {
        rounding = 5;
        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = true;
        bezier = [ "overshot, 0.13, 0.99, 0.29, 1.1" ];
        animation = [
          "windows, 1, 3, overshot, slide"
          "windowsOut, 1, 7, overshot, slide"
          "border, 1, 10, default"
          "fade, 0, 0, default"
          "workspaces, 0, 6, default"
        ];
      };
      windowrulev2 = [
        "float,title:^(flameshot)"
        # "move 0 -350,title:^(flameshot)"
        "suppressevent fullscreen,title:^(flameshot)"
        "noanim,title:^(flameshot)"
        "rounding 0,title:^(flameshot)"
        "monitor DP-2,title:^(flameshot)"
        "float,title:^(Firefox — Sharing Indicator)"
        "nomaxsize,title:^(winecfg)"
        "nomaxsize,class:^(steam)"
        "noanim,title:^(wlogout)"
        "float,title:^(wlogout)"
        "workspace 1, class:^(firefox)"
        "workspace 2,class:^(discord)"
        "workspace 2,class:^(vesktop)"
        "workspace 3,title:^(Steam)"
        "workspace 3,class:^(org.prismlauncher.PrismLauncher)"
        "workspace 4,class:^(mpv)"
        "workspace 4,class:^(libreoffice*)"
        "workspace 5,initialTitle:^(nvim)"
        "workspace 6,class:^(krita)"
        "workspace 6,class:^(.gimp-2.10-wrapped_)"
        "workspace 7,class:^(evince)"
        "workspace 7,class:^(info.febvre.Komikku)"
        "workspace 7,class:^(Upscayl)"
        "workspace 8,class:^(com.obsproject.Studio)"
        "workspace 9,class:^(obsidian)"
        "workspace 9,class:^(Waydroid)"
        "workspace 10,class:^(steam_app*)"
        "workspace 10,class:^(org.vinegarhq.Sober)"
        "workspace 10,class:^(osu!)"
        "stayfocused,class:^(Waydroid)"
        "float,initialTitle:^(Picture-in-Picture)"
        "pin,initialTitle:^(Picture-in-Picture)"
        # "forceinput,class:^(Waydroid)"

      ];
      layerrule = [
        "noanim,rofi"
        "xray 1, wofi"
        "noanim, wayfreeze"
        "noanim, selection"

      ];
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      gestures = {
        workspace_swipe = true;
      };
      # group = {
      #   "col.border_active" = "rgb(99D1DB)";
      #   "col.border_inactive" = "rgb(4d4d4d)";
      # "col.group_border_active" = "rgb(99D1DB)";
      # "col.group_border_inactive" = "rgb(4d4d4d)";
      #   groupbar = {
      #       gradients = false;
      #       render_titles = false;
      #     };
      #   };
      misc = {
        force_default_wallpaper = false;
      };
    };
    extraConfig = ''
      debug:disable_logs = false
      group {
        col.border_active = rgb(99D1DB)
        col.border_inactive = rgb(4d4d4d)
        groupbar {
            col.active = rgb(99D1DB)
            col.inactive = rgb(4d4d4d)
            gradients = false
            render_titles = false
          }
      }
      plugin {
          hyprbars {
              bar_height = 30
              bar_color = rgb(303447)
              col.text = rgb(99D1DB)
              bar_text_size = 12
              bar_text_font = Iosevka Nerd Font Bold
              bar_button_padding = 12
              bar_padding = 10
              bar_precedence_over_border = true
              hyprbars-button = $color1, 20, ✖, hyprctl dispatch killactive
              hyprbars-button = $color3, 20, ⛶, hyprctl dispatch fullscreen 1
              hyprbars-button = $color4, 20, −, hyprctl dispatch togglefloating
        }
      }

      plugin {
        hy3 {
          # disable gaps when only one window is onscreen
          no_gaps_when_only = false

          # offset from group split direction when only one window is in a group
          group_inset = 10

          # tab group settings
          tabs {
            # height of the tab bar
            height = 10

            # padding between the tab bar and its focused node
            padding = 15

            # the tab bar should animate in/out from the top instead of below the window
            from_top = false

            # render the window title on the bar
            render_text = false

            # rounding of tab bar corners
            rounding = 15

            # font to render the window title with
            text_font = "Terminess Nerd Font"

            # height of the window title
            text_height = 10

            # left padding of the window title
            text_padding = 0

            # active tab bar segment color
            col.active = rgb(c8c093)

            # urgent tab bar segment color
            col.urgent = 0x4D6469

            # inactive tab bar segment color
            col.inactive = 0x4D6469

            # active tab bar text color
            col.text.active = 0x4D6469

            # urgent tab bar text color
            col.text.urgent = 0x4D6469

            # inactive tab bar text color
            col.text.inactive = 0x4D6469
          }
        }
      }
      plugin {
          hyprexpo {
              columns = 4
              gap_size = 5
              workspace_method = first 1 # [center/first] [workspace] e.g. first 1 or center m+1

              enable_gesture = true # laptop touchpad
              gesture_fingers = 3  # 3 or 4
              gesture_distance = 300 # how far is the "max"
              gesture_positive = true # positive = swipe down. Negative = swipe up.
          }
      }
    '';
  };
}
