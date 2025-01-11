{
  config,
  osConfig,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  # balls
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd = {
      enable = true;
      variables = [
        "DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
    };
    xwayland.enable = true;
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
      # inputs.hyprspace.packages.${pkgs.system}.Hyprspace
      pkgs.hyprlandPlugins.csgo-vulkan-fix
      pkgs.hyprlandPlugins.hyprbars
      pkgs.hyprlandPlugins.hyprspace
    ];
    settings = {
      "$mainMod" = "SUPER";
      "general:layout" = "master";
      monitor =
        if (osConfig.users.users.${config.home.username}.description == "vaporsnake") then
          [
            "DP-2,2560x1440@164.998993, 0x350, 1"
            "HDMI-A-1,1920x1080,2560x0, 1, transform, 3"
          ]
        else if (osConfig.users.users.${config.home.username}.description == "liquid") then
          [ "eDP-1,1920x1200@60.001999, 0x0, 1" ]
        else
          [ ];
      exec-once =
        [
          "hyprswitch init &"
          "${pkgs.nwg-panel}/bin/nwg-panel --style gtk"
          "mullvad-gui"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "hyprctl setcursor ${config.home.pointerCursor.name} 24"
          "flatpak run gg.guilded.Guilded"
          "discover-overlay"
          "flameshot"
          "obs --startreplaybuffer --disable-shutdown-check"
          # Here's how you grab the username within home manager. I'm looking at you, ardishco.
          "mpv --playlist=/home/${osConfig.users.users.${config.home.username}.description}/Music/MainMenu --no-video --shuffle --volume=22"
          "${pkgs.thunderbird}/bin/thunderbird"
          "${pkgs.electron-mail}/bin/electron-mail"
          "${pkgs.hyprsunset}/bin/hyprsunset -t 4500"
          "${pkgs.element-desktop}/bin/element-desktop --hidden"
          "${pkgs.signal-desktop}/bin/signal-desktop --start-in-tray"
          "${pkgs.wlsunset}/bin/wlsunset"
          "${pkgs.swaynotificationcenter}/bin/swaync"
          "${pkgs.swayidle}/bin/swayidle -C ~/.config/swayidle/config"
          "${pkgs.swayosd}/bin/swayosd-server"
          "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1"
          "${pkgs.hypridle}/bin/hypridle"
          "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store"
          # "${pkgs.wl-clipboard}/bin/wl-copy --type text --watch ${pkgs.cliphist}/bin/cliphist store"
          # "${pkgs.premid}/bin/premid --in-process-gpu"
          "${pkgs.nwg-dock-hyprland}/bin/nwg-dock-hyprland -d"
          # "${pkgs.kdePackages.krunner}/bin/krunner -d"
        ]
        ++ (lib.lists.optionals (osConfig.users.users.${config.home.username}.description == "vaporsnake") [
          "${pkgs.swaybg}/bin/swaybg --o DP-2 -i ${../../../assets/wallpapers/strawHats.png}"
          "${pkgs.swaybg}/bin/swaybg --o HDMI-A-1 -i ${../../../assets/wallpapers/mark-of-sacrifice-vertical.png}"
          "${pkgs.noisetorch}/bin/noisetorch -i alsa_input.usb-IK_Multimedia_iRig_Mic_HD_2_N_A-00.mono-fallback"
        ])
        ++ (lib.lists.optionals (osConfig.users.users.${config.home.username}.description == "liquid") [
          "${pkgs.swaybg}/bin/swaybg --o eDP-1 -i ${../../../assets/wallpapers/berserk-catppuccin.png}"
        ]);
      workspace =
        if (osConfig.users.users.${config.home.username}.description == "vaporsnake") then
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
        else if (osConfig.users.users.${config.home.username}.description == "liquid") then
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
          # "CTRL, Escape, exec, ${pkgs.kdePackages.krunner}/bin/krunner"
          "$mainMod, E, togglesplit, # dwindle"
          "$mainMod,F,fullscreen"
          # '',Print, exec, ${
          #   inputs.wayfreeze.packages.${pkgs.system}.wayfreeze
          # }/bin/wayfreeze --hide-cursor & PID=$!; sleep .1; ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${
          #   inputs.shadower.packages.${pkgs.system}.shadower
          # }/bin/shadower | ${pkgs.wl-clipboard}/bin/wl-copy; kill $PID''
          ",Print,exec, ${pkgs.flameshot}/bin/flameshot gui -r | ${pkgs.wl-clipboard}/bin/wl-copy | ${pkgs.wl-clipboard}/bin/wl-paste | ${inputs.shadower.packages.${pkgs.system}.shadower}/bin/shadower | ${pkgs.wl-clipboard}/bin/wl-paste"
          "CTRL, Print, exec, ${pkgs.flameshot}/bin/flameshot gui"
          "$mainMod, Tab, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t"
          "Alt_L, E, exec, hyprctl dispatch workspace +1"
          "Alt_L, Q, exec, hyprctl dispatch workspace -1"
          # "$mainMod, T, exec, ${inputs.hyprcontrib.packages.${pkgs.system}.hdrop}/bin/hdrop ${pkgs.kitty}/bin/kitty --class dropdown-kitty"
          "$mainMod, V, exec, ${pkgs.cliphist}/bin/cliphist list | anyrun --show-results-immediately true --plugins ${inputs.anyrun.packages.${pkgs.system}.stdin}/lib/libstdin.so | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy"
          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, quotedbl, exec, ${pkgs.libnotify}/bin/notify-send 'Recording saved' 'check /home/${osConfig.users.users.${config.home.username}.description}/Videos'"
          ",Pause, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
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
          # "Alt_L, Tab, overview:toggle"

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
          # This part is really awesome. 
          # Like really really cool, you could even say it's cool beans. 
          
          # Hyprspace window switcher toggle 
          # "Alt_L, Tab, exec, overview:toggle"
          "Alt_L, Tab, exec, hyprswitch gui --mod-key alt_l --key Tab --close mod-key-release --sort-recent"
        ]
        ++ (lib.lists.optionals (osConfig.users.users.${config.home.username}.description == "vaporsnake") [
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
      input = {
        kb_layout = "tr,lv";
        kb_options = "grp:rctrl_toggle";
        follow_mouse = 2;
        touchpad = {
          natural_scroll = true;
        };
        float_switch_override_focus = 2;
        scroll_factor = 2.0;
        accel_profile = "adaptive";
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgb(99D1DB)";
        layout = "master";
        resize_on_border = true;
        allow_tearing = true;
      };
      decoration = {
        rounding = 5;
        # drop_shadow = false;
        # shadow_range = 4;
        # shadow_render_power = 3;
        # "col.shadow" = "rgba(1a1a1aee)";
      };
      animations = {
        enabled = true;
        bezier = [ "overshot, 0.13, 0.99, 0.29, 1.1" ];
        animation = [
          "windows, 1, 3, overshot, slide"
          "windowsOut, 1, 7, overshot, slide"
          "border, 1, 10, default"
          "fade, 0, 1, default"
          "workspaces, 0, 6, default"
        ];
      };
      windowrulev2 = [
        "float,class:^(flameshot)"
        # "move 0 -350,title:^(flameshot)"
        "suppressevent fullscreen,class:^(flameshot)"
        "noanim,class:^(flameshot)"
        "rounding 0,class:^(flameshot)"
        "monitor DP-2,class:^(flameshot)"
        "stayfocused,class:^(flameshot)"
        "pin,class:^(flameshot)"
        "float,title:^(Firefox — Sharing Indicator)"
        "nomaxsize,title:^(winecfg)"
        "nomaxsize,class:^(steam)"
        "noanim,title:^(wlogout)"
        "float,title:^(wlogout)"
        "pin,initialTitle:^(Discord Popout)"
        "float,initialTitle:^(Discord Popout)"
        "opacity 0.5,initialTitle:^(Discord Popout)"
        "workspace 1 silent, class:^(firefox)"
        "workspace 2 silent,class:^(discord)"
        "workspace 2 silent,class:^(vesktop)"
        "workspace 2 silent,class:^(Signal Beta)"
        "workspace 2 silent,class:^(Guilded)"
        "workspace 2 silent,class:^(Element)"
        "workspace 2 silent,class:^(soundux)"
        "workspace 3 silent,title:^(Steam)"
        "workspace 3 silent,class:^(steam)"
        "workspace 3 silent,class:^(org.prismlauncher.PrismLauncher)"
        "workspace 4 silent,initialClass:^(thunderbird)"
        "workspace 4 silent,initialClass:^(electron-mail)"
        "workspace 5 silent,initialTitle:^(nvim)"
        "workspace 6 silent,class:^(libreoffice*)"
        "workspace 6 silent,class:^(krita)"
        "workspace 6 silent,class:^(.gimp-2.10-wrapped_)"
        "workspace 7 silent,class:^(mpv)"
        "workspace 7 silent,class:^(evince)"
        "workspace 7 silent,class:^(info.febvre.Komikku)"
        "workspace 7 silent,class:^(Upscayl)"
        "workspace 8 silent,class:^(com.obsproject.Studio)"
        "workspace 7 silent,class:^(obsidian)"
        "workspace 9 silent,class:^(Waydroid)"
        "workspace 10,class:^(steam_app*)"
        "workspace 10,class:^(org.vinegarhq.Sober)"
        "workspace 10,class:^(osu!)"
        "stayfocused,class:^(osu!)"
        "stayfocused,class:^(Waydroid)"
        "float,initialTitle:^(Picture-in-Picture)"
        "pin,initialTitle:^(Picture-in-Picture)"
        "opacity 0.5,initialTitle:^(Picture-in-Picture)"
        "float,initialTitle:^(MainPicker)"
        "immediate,fullscreenstate:* 1"
        "immediate,fullscreenstate:1 *"
        "immediate,onworkspace:10"
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
        middle_click_paste = false;
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
              hyprbars-button = rgb(E78284), 20, ✖, hyprctl dispatch killactive
              hyprbars-button = rgb(A6D189), 20, ⛶, hyprctl dispatch fullscreen 1
              hyprbars-button = rgb(B5BFE2), 20, −, hyprctl dispatch togglefloating
              bar_precedence_over_border = false
              bar_part_of_window = true
              bar_padding = 5
        }
      }
      plugin {
          overview {
              autoDrag = true
              switchOnDrop = false 
              panelHeight = 130
              workspaceActiveBorder = rgb(99D1DB)
              showSpecialWorkspace = true
              showEmptyWorkspace = true
              showNewWorkspace = true
              autoScroll = false
              # affectStrut = false
              workspaceBorderSize = 2
              workspaceMargin = 24
              panelColor = rgb(303447)
              panelBorderColor = rgb(99D1DB)
          }
      }
    '';
  };
}
