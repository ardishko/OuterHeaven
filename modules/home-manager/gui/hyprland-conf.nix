{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = [
        "DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
    };
    xwayland.enable = true;
    plugins = [
      #inputs.hy3.packages.${pkgs.system}.hy3
      #inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
    ];
    settings = {
      "$mainMod" = "SUPER";
      "general:layout" = "dwindle";
      monitor = [
        "DP-2,2560x1440@164.998993, 0x350, 1"
        "HDMI-A-1,1920x1080,2560x0, 1, transform, 3"
      ];
      exec-once = [
        "mullvad-gui"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hyprctl setcursor macOS-BigSur 24"
        "discover-overlay"
        "flameshot"
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.swaybg}/bin/swaybg --o DP-2 -i ${../../../images/wallpapers/vergil-catppuccin.png}"
        "${pkgs.swaybg}/bin/swaybg --o HDMI-A-1 -i ${../../../images/wallpapers/mark-of-sacrifice-vertical.png}"
        "${pkgs.wlsunset}/bin/wlsunset"
        "${pkgs.swaynotificationcenter}/bin/swaync"
        "${pkgs.swayidle}/bin/swayidle -C ~/.config/swayidle/config"
        "${pkgs.premid}/bin/premid --in-process-gpu"
        "${pkgs.swayosd}/bin/swayosd-server"
        "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1"
        "${pkgs.xwaylandvideobridge}/bin/xwaylandvideobridge"
      ];
      workspace = [
        "DP-2,1"
        "DP-2,2"
        "DP-2,3"
        "DP-2,4"
        "DP-2,5"      
        "DP-2,6"
        "DP-2,7"       
        "DP-2,8"
        "DP-2,9"
        "DP-2,10"
        "HDMI-A-1,11"
        "HDMI-A-1,12"
        "HDMI-A-1,13"
        "HDMI-A-1,14"
      ];
      bind = [
        "$mainMod, Return, exec, kitty"
        "SUPER_SHIFT, W, killactive,"
        "SUPER_SHIFT, Del, exec, pkill Hyprland"
        "$mainMod, A, togglefloating,"
        "CTRL, Escape, exec, ${inputs.anyrun.packages.${pkgs.system}.anyrun}/bin/anyrun"
        "$mainMod SHIFT, F, exec, ${pkgs.gnome.nautilus}/bin/nautilus"
        "$mainMod, E, togglesplit, # dwindle"
        "$mainMod,F,fullscreen"
        ",Print, exec, flameshot gui"
        "$mainMod, Tab, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t"
        "SUPER_SHIFT, minus, exec, ${inputs.hyprcontrib.packages.${pkgs.system}.scratchpad}/bin/scratchpad"
        "$mainMod, minus, exec, ${inputs.hyprcontrib.packages.${pkgs.system}.scratchpad}/bin/scratchpad -g"
        "$mainMod, T, exec, ${inputs.hyprcontrib.packages.${pkgs.system}.hdrop}/bin/hdrop ${pkgs.kitty}/bin/kitty --class dropdown-kitty"
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        
        #i3/sway type beat
        ",Caps_Lock, exec, sleep 0.1 && ${pkgs.swayosd}/bin/swayosd-client --caps-lock"
        "$mainMod, Q, togglegroup"
        "$mainMod, D, changegroupactive"
        "$mainMod, W, lockgroups, toggle"
       
        #global shortcuts
        "SUPER,F10,pass,^(com\.obsproject\.Studio)$"
        "SUPER,F9,pass,^(com\.obsproject\.Studio)$"
        "SUPER,F4,pass,^(com\.obsproject\.Studio)$"
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
        "$mainMod, h, workspace, 11"
        "$mainMod, j, workspace, 12"
        "$mainMod, k, workspace, 13"
        "$mainMod, l, workspace, 14"

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
        "$mainMod SHIFT, h, movetoworkspacesilent, 11"
        "$mainMod SHIFT, j, movetoworkspacesilent, 12"
        "$mainMod SHIFT, k, movetoworkspacesilent, 13"
        "$mainMod SHIFT, l, movetoworkspacesilent, 14"

        # Move window with mainMod_SHIFT + arrow keys
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_up, workspace, r+1"
        "$mainMod, mouse_down, workspace, r-1"
      ];
      bindm = [ 
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      input = {
        kb_layout = "tr,us";
        kb_options = "grp:rctrl_toggle";
        follow_mouse = true;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgb(99D1DB)";
        layout = "dwindle";
        resize_on_border = true;
        no_cursor_warps = true;
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
        bezier = [
          "overshot, 0.13, 0.99, 0.29, 1.1"
        ];
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
        "move 0 -350,title:^(flameshot)"
        "nofullscreenrequest,title:^(flameshot)"
        "noanim,title:^(flameshot)"
        "rounding 0,title:^(flameshot)"
        "float,title:^(Firefox — Sharing Indicator)"
        "nomaxsize,title:^(winecfg)"
        "nomaxsize,class:^(steam)"
        "noanim,title:^(wlogout)"
        "float,title:^(wlogout)"
        "workspace 1, class:^(floorp)"
        "workspace 2,class:^(discord)"
        "workspace 3,initialTitle:^(Steam)"
        "workspace 5,initialTitle:^(nvim)"
        "workspace 7,class:^(info.febvre.Komikku)"
        "workspace 8,class:^(obsidian)"
      ];
      layerrule = [
        "noanim,rofi"
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
              bar_height=29
              bar_text_font="Terminess Nerd Font"
              bar_text_size=13
              # config
              buttons {
                  button_size= 13
                  # button config
              }
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
     '';
  };
}
