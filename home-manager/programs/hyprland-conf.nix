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
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
    plugins = [
      #inputs.hy3.packages.${pkgs.system}.hy3
      #inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix
    ];
    settings = {
      "$mainMod" = "SUPER";
    };
    extraConfig = ''
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki
      exec-once = mullvad-gui
      exec-once = noisetorch -i
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=DP-2,2560x1440@164.998993,0x350,1
      monitor=HDMI-A-1,1920x1080,2560x0,1,transform,3
      exec-once=waybar
      exec-once=swaybg --o DP-2 -i ~/nixcfg/images/wallpapers/vergil-catppuccin.png
      exec-once=swaybg --o HDMI-A-1 -i ~/nixcfg/images/wallpapers/mark-of-sacrifice-vertical.png
      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      general:layout = dwindle

      # Execute your favorite apps at launch
      exec-once=flameshot
      exec-once=easyeffects --hide-window
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once=discover-overlay
      exec-once=/usr/bin/flameshot
      exec-once=hyprctl setcursor macOS-BigSur 24
      exec-once=swayidle -C /home/vaporsnake/.config/swayidle/config
      exec-once=swaync
      exec-once=swayosd-server
      exec-once=wlsunset
      exec-once=/nix/store/$(ls -la /nix/store | grep 'mate-polkit' | grep '4096' | awk '{print $9}' | sed -n '$p')/libexec/polkit-mate-authentication-agent-1
      exec-once=premid --in-process-gpu

      # Window rules
      windowrulev2=float,title:^(flameshot)
      windowrulev2=move 0 0,title:^(flameshot)
      windowrulev2=nofullscreenrequest,title:^(flameshot)
      windowrulev2=noanim,title:^(flameshot)
      windowrulev2=rounding 0,title:^(flameshot)
      layerrule=noanim,rofi
      windowrulev2=float,title:^(Firefox — Sharing Indicator)
      windowrulev2=nomaxsize,title:^(.*)
      windowrulev2=noanim,title:^(wlogout)
      windowrulev2=float,title:^(wlogout)

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
          kb_layout = tr,us
          kb_variant =
          kb_model =
          kb_options = grp:rctrl_toggle
          kb_rules =

          follow_mouse = 1

          touchpad {
              natural_scroll = yes
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
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

      general {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          gaps_in = 5
          gaps_out = 20
          border_size = 2
          col.active_border = rgb(99D1DB)
          layout = dwindle
          cursor_inactive_timeout = 0
          resize_on_border = true
          no_cursor_warps = true
      }

      decoration {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more

          rounding = 5
          drop_shadow = no
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      animations {
          enabled = yes

          # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

          bezier = overshot, 0.13, 0.99, 0.29, 1.1

          animation = windows, 1, 3, overshot, slide
          animation = windowsOut, 1, 7, overshot, slide
          animation = border, 1, 10, default
          animation = fade, 0, 0, default
          animation = workspaces, 0, 6, default
      }

      dwindle {
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = yes # you probably want this
      }

      master {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = true
      }

      gestures {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = off
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic mouse V1 {
          sensitivity = -0.5
      }
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

      misc {
          force_default_wallpaper = 0
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      # See https://wiki.hyprland.org/Configuring/Keywords/ for more

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

      bind = $mainMod, Return, exec, kitty
      bind = SUPER_SHIFT, W, killactive,
      bind = SUPER_SHIFT, Del, exec, pkill Hyprland
      bind = $mainMod, A, togglefloating,
      bind = CTRL, Escape, exec, anyrun
      bind = $mainMod SHIFT, F, exec, nemo
      bind = $mainMod, R, pseudo, # dwindle
      bind = $mainMod, E, togglesplit, # dwindle
      bind = $mainMod,F,fullscreen
      bind =,Print, exec, flameshot gui
      bind =CTRL, Print, exec, hyprshot -m region
      bind = $mainMod, Tab, exec, swaync-client -t

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      #i3/sway type beat
      bind = ,Caps_Lock, exec, sleep 0.1 && swayosd-client --caps-lock
      bind = $mainMod, Q, togglegroup
      bind = $mainMod, D, changegroupactive
      bind = $mainMod, W, lockgroups, toggle
      #bind = $mainMod, V, hy3:makegroup

      #global shortcuts
      bind = SUPER,F10,pass,^(com\.obsproject\.Studio)$
      bind = SUPER,F9,pass,^(com\.obsproject\.Studio)$
      bind = SUPER,F4,pass,^(com\.obsproject\.Studio)$
      bind = CTRL_SHIFT,M,pass,^(vencorddesktop)
      bind = CTRL_SHIFT,D,pass,^(vencorddesktop)

      #workspace bindings to monitors
      workspace=DP-2,1
      workspace=DP-2,2
      workspace=DP-2,3
      workspace=DP-2,4
      workspace=DP-2,5
      workspace=DP-2,6
      workspace=DP-2,7
      workspace=DP-2,8
      workspace=DP-2,9
      workspace=DP-2,10
      workspace=HDMI-A-1,11
      workspace=HDMI-A-1,12
      workspace=HDMI-A-1,13
      workspace=HDMI-A-1,14

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      bind = $mainMod, h, workspace, 11
      bind = $mainMod, j, workspace, 12
      bind = $mainMod, k, workspace, 13
      bind = $mainMod, l, workspace, 14

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10
      bind = $mainMod SHIFT, h, movetoworkspacesilent, 11
      bind = $mainMod SHIFT, j, movetoworkspacesilent, 12
      bind = $mainMod SHIFT, k, movetoworkspacesilent, 13
      bind = $mainMod SHIFT, l, movetoworkspacesilent, 14

      # Move window with mainMod_SHIFT + arrow keys
      bind = $mainMod SHIFT, left, movewindow, l
      bind = $mainMod SHIFT, right, movewindow, r
      bind = $mainMod SHIFT, up, movewindow, u
      bind = $mainMod SHIFT, down, movewindow, d

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_up, workspace, r+1
      bind = $mainMod, mouse_down, workspace, r-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
    '';
  };
}
