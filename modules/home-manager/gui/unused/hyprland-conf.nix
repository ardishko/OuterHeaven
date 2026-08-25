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
    configType = "lua";
    systemd = {
      enable = true;
      variables = [
        "--all"
      ];
    };
    xwayland.enable = true;
    plugins = [
      # pkgs.hyprlandPlugins.csgo-vulkan-fix
      # pkgs.hyprlandPlugins.hyprbars
    ];

    settings = {
      monitor =
        if (osConfig.users.users.${config.home.username}.description == "vaporsnake") then
          [
            {
              output = "DP-2";
              mode = "2560x1440@164.998993";
              position = "0x350";
              scale = 1;
            }
          ]
        else if (osConfig.users.users.${config.home.username}.description == "liquid") then
          [
            {
              output = "eDP-2";
              mode = "2560x1600@165.00Hz";
              position = "0x0";
              scale = 1;
            }
          ]
        else
          [ ];

      exec_cmd = [
        "mullvad-gui"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "hyprctl setcursor ${config.home.pointerCursor.name} 38"
        "discover-overlay"
        "flameshot"
        "obs --startreplaybuffer --disable-shutdown-check"
        # Here's how you grab the username within home manager. I'm looking at you, ardishco.
        "mpv --playlist=/home/${
          osConfig.users.users.${config.home.username}.description
        }/Music/MainMenu --no-video --shuffle --volume=22"
        "${pkgs.thunderbird}/bin/thunderbird"
        "${pkgs.hyprsunset}/bin/hyprsunset -t 4500"
        "${pkgs.element-desktop}/bin/element-desktop --hidden"
        "${pkgs.mullvad}/bin/mullvad-exclude ${pkgs.signal-desktop}/bin/signal-desktop --password-store=basic_text --no-sandbox --start-in-tray"
        "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1"
        "${pkgs.hypridle}/bin/hypridle"
        "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store"
        "qs -c overview"
        # "${pkgs.wl-clipboard}/bin/wl-copy --type text --watch ${pkgs.cliphist}/bin/cliphist store"
        # "${pkgs.premid}/bin/premid --in-process-gpu"
        # "${pkgs.kdePackages.krunner}/bin/krunner -d"
      ]
      ++ (lib.lists.optionals (osConfig.users.users.${config.home.username}.description == "vaporsnake") [
        "${pkgs.swaybg}/bin/swaybg --o DP-2 -i ${../../../assets/wallpapers/strawHats.png}"
        "${pkgs.swaybg}/bin/swaybg --o HDMI-A-1 -i ${../../../assets/wallpapers/mark-of-sacrifice-vertical.png}"
      ])
      ++ (lib.lists.optionals (osConfig.users.users.${config.home.username}.description == "liquid") [
        "${pkgs.swaybg}/bin/swaybg --o eDP-1 -i ${../../../assets/wallpapers/berserk-catppuccin.png}"
      ]);

      workspace_rule =
        if (osConfig.users.users.${config.home.username}.description == "vaporsnake") then
          [
            {
              workspace = "1";
              monitor = "DP-2";
            }
            {
              workspace = "2";
              monitor = "DP-2";
            }
            {
              workspace = "3";
              monitor = "DP-2";
            }
            {
              workspace = "4";
              monitor = "DP-2";
            }
            {
              workspace = "5";
              monitor = "DP-2";
            }
            {
              workspace = "6";
              monitor = "DP-2";
            }
            {
              workspace = "7";
              monitor = "DP-2";
            }
            {
              workspace = "8";
              monitor = "DP-2";
            }
            {
              workspace = "9";
              monitor = "DP-2";
            }
            {
              workspace = "10";
              monitor = "DP-2";
            }
          ]
        else if (osConfig.users.users.${config.home.username}.description == "liquid") then
          [
            # {
            #   workspace = "1";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "2";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "3";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "4";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "5";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "6";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "7";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "8";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "9";
            #   monitor = "eDP-2";
            # }
            # {
            #   workspace = "10";
            #   monitor = "eDP-2";
            # }
          ]
        else
          [ ];

      config = {
        input = {
          kb_layout = "tr,lv,se";
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
          layout = "scrolling";
          resize_on_border = true;
          allow_tearing = true;
        };

        # niri-like scrolling tape
        scrolling = {
          column_width = 0.5;
        };

        decoration = {
          rounding = 5;
        };

        group = {
          "col.border_active" = "rgb(99D1DB)";
          "col.border_inactive" = "rgb(4d4d4d)";
          groupbar = {
            "col.active" = "rgb(99D1DB)";
            "col.inactive" = "rgb(4d4d4d)";
            gradients = false;
            render_titles = false;
          };
        };

        misc = {
          force_default_wallpaper = false;
          middle_click_paste = false;
        };

        debug = {
          disable_logs = false;
        };
      };

      window_rule = [
        {
          match.class = "^(flameshot)";
          float = true;
        }
        {
          match.class = "^(flameshot)";
          no_anim = true;
        }
        {
          match.class = "^(flameshot)";
          rounding = 0;
        }
        {
          match.class = "^(flameshot)";
          pin = true;
        }
        {
          match.title = "^(Firefox — Sharing Indicator)";
          float = true;
        }
        {
          match.title = "^(wlogout)";
          no_anim = true;
        }
        {
          match.title = "^(wlogout)";
          float = true;
        }
        {
          match.initial_title = "^(Discord Popout)";
          pin = true;
        }
        {
          match.initial_title = "^(Discord Popout)";
          float = true;
        }
        {
          match.initial_title = "^(Discord Popout)";
          opacity = 0.5;
        }
        {
          match.class = "^(firefox)";
          workspace = "1";
        }
        {
          match.class = "^(librewolf)";
          workspace = "1";
        }
        {
          match.class = "^(discord)";
          workspace = "2";
        }
        {
          match.class = "^(vesktop)";
          workspace = "2";
        }
        {
          match.class = "^(Signal Beta)";
          workspace = "2";
        }
        {
          match.class = "^(Guilded)";
          workspace = "2";
        }
        {
          match.class = "^(Element)";
          workspace = "2";
        }
        {
          match.class = "^(soundux)";
          workspace = "2";
        }
        {
          match.title = "^(Steam)";
          workspace = "3";
        }
        {
          match.class = "^(steam)";
          workspace = "3";
        }
        {
          match.class = "^(org.prismlauncher.PrismLauncher)";
          workspace = "3";
        }
        {
          match.initial_class = "^(thunderbird)";
          workspace = "4";
        }
        {
          match.initial_class = "^(electron-mail)";
          workspace = "4";
        }
        {
          match.initial_title = "^(nvim)";
          workspace = "5";
        }
        {
          match.class = "^(libreoffice*)";
          workspace = "6";
        }
        {
          match.class = "^(krita)";
          workspace = "6";
        }
        {
          match.class = "^(.gimp-2.10-wrapped_)";
          workspace = "6";
        }
        {
          match.class = "^(mpv)";
          workspace = "7";
        }
        {
          match.class = "^(info.febvre.Komikku)";
          workspace = "7";
        }
        {
          match.class = "^(Upscayl)";
          workspace = "7";
        }
        {
          match.class = "^(obsidian)";
          workspace = "7";
        }
        {
          match.class = "^(com.obsproject.Studio)";
          workspace = "8";
        }
        {
          match.class = "^(Waydroid)";
          workspace = "9";
        }
        {
          match.class = "^(steam_app.*)";
          workspace = "10";
        }
        {
          match.initial_class = "^(steam_app.*)";
          workspace = "10";
        }
        {
          match.class = "^(org.vinegarhq.Sober)";
          workspace = "10";
        }
        {
          match.class = "^(osu!)";
          workspace = "10";
        }
        {
          match.initial_title = "^(Picture-in-Picture)";
          float = true;
        }
        {
          match.initial_title = "^(Picture-in-Picture)";
          pin = true;
        }
        {
          match.initial_title = "^(Picture-in-Picture)";
          opacity = 0.5;
        }
        {
          match.initial_title = "^(MainPicker)";
          float = true;
        }
        {
          match.initial_class = "^(steam_app.*)";
          immediate = true;
        }
        {
          match.class = "^(steam_app.*)";
          immediate = true;
        }
        {
          match.class = "^(org.vinegarhq.Sober)";
          immediate = true;
        }
        {
          match.class = "^(osu!)";
          immediate = true;
        }
        {
          match.class = "^(steam_app.*)";
          immediate = true;
        }
        {
          match.initial_class = "^(steam_app.*)";
          immediate = true;
        }
        {
          match.class = "^(org.vinegarhq.Sober)";
          immediate = true;
        }
        {
          match.class = "^(osu!)";
          immediate = true;
        }
        {
          match.fullscreen = true;
          immediate = true;
        }
        {
          match.class = "^(net.lutris.Lutris)";
          immediate = true;
        }
        {
          match.class = "^(com.heroicgameslauncher.hgl)";
          immediate = true;
        }
      ];

      layer_rule = [
        {
          match.namespace = "rofi";
          no_anim = true;
        }
        {
          match.namespace = "wayfreeze";
          no_anim = true;
        }
        {
          match.namespace = "selection";
          no_anim = true;
        }
      ];
    };

    # Everything that needs to be a Lua *call* lives here as plain Lua.
    extraConfig = ''
      local mainMod = "SUPER"

      -- animations
      hl.curve("overshot", { type = "bezier", points = { {0.13, 0.99}, {0.29, 1.1} } })
      hl.animation({ leaf = "windows",    enabled = true,  speed = 3,  bezier = "overshot", style = "slide" })
      hl.animation({ leaf = "windowsOut", enabled = true,  speed = 7,  bezier = "overshot", style = "slide" })
      hl.animation({ leaf = "border",     enabled = true,  speed = 10, bezier = "default" })
      hl.animation({ leaf = "fade",       enabled = false, speed = 1,  bezier = "default" })
      hl.animation({ leaf = "workspaces", enabled = false, speed = 6,  bezier = "default" })

      -- apps
      hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("ghostty"))
      hl.bind("CTRL + Escape", hl.dsp.exec_cmd("${
        inputs.anyrun.packages.${pkgs.system}.anyrun
      }/bin/anyrun"))
      hl.bind("Pause", hl.dsp.exec_cmd("${pkgs.playerctl}/bin/playerctl play-pause"))
      hl.bind("CTRL + Print", hl.dsp.exec_cmd("${pkgs.flameshot}/bin/flameshot gui"))
      hl.bind("Print", hl.dsp.exec_cmd([==[${pkgs.flameshot}/bin/flameshot gui -r | ${pkgs.wl-clipboard}/bin/wl-copy | ${pkgs.wl-clipboard}/bin/wl-paste | ${
        inputs.shadower.packages.${pkgs.system}.shadower
      }/bin/shadower | ${pkgs.wl-clipboard}/bin/wl-paste]==]))
      hl.bind(mainMod .. " + V", hl.dsp.exec_cmd([==[${pkgs.cliphist}/bin/cliphist list | anyrun --show-results-immediately true --plugins ${
        inputs.anyrun.packages.${pkgs.system}.stdin
      }/lib/libstdin.so | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy]==]))
      hl.bind(mainMod .. " + quotedbl", hl.dsp.exec_cmd([==[${pkgs.libnotify}/bin/notify-send 'Recording saved' 'check /home/${
        osConfig.users.users.${config.home.username}.description
      }/Videos']==]))

      -- window management
      hl.bind("ALT + F4", hl.dsp.window.close())
      hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.close())
      hl.bind("ALT + Tab", hl.dsp.exec_cmd("qs ipc -c qs-hyprview call expose open smartgrid"))
      hl.bind("SUPER + SHIFT + Delete", hl.dsp.exec_cmd("pkill Hyprland"))
      hl.bind(mainMod .. " + A", hl.dsp.window.float({ action = "toggle" }))
      hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

      hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
      hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
      hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
      hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

      hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
      hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
      hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
      hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

      hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
      hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

      -- groups
      hl.bind(mainMod .. " + Q", hl.dsp.group.toggle())
      hl.bind(mainMod .. " + D", hl.dsp.group.next())
      hl.bind(mainMod .. " + W", hl.dsp.group.lock({ action = "toggle" }))

      -- workspaces
      for i = 1, 10 do
        local key = tostring(i % 10)
        hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))
        hl.bind(mainMod .. " + SHIFT + " .. key,
          hl.dsp.window.move({ workspace = tostring(i), follow = false }))
      end

      hl.bind(mainMod .. " + minus", hl.dsp.window.move({ workspace = "special:scratchpad" }))
      hl.bind("ALT + E", hl.dsp.focus({ workspace = "+1" }))
      hl.bind("ALT + Q", hl.dsp.focus({ workspace = "-1" }))
      hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "r+1" }))
      hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "r-1" }))

      -- scrolling layout
      hl.bind(mainMod .. " + bracketleft",  hl.dsp.layout("focus l"))
      hl.bind(mainMod .. " + bracketright", hl.dsp.layout("focus r"))
      hl.bind(mainMod .. " + comma",  hl.dsp.layout("move -col"))
      hl.bind(mainMod .. " + period", hl.dsp.layout("move +col"))
      hl.bind(mainMod .. " + SHIFT + comma",  hl.dsp.layout("swapcol l"))
      hl.bind(mainMod .. " + SHIFT + period", hl.dsp.layout("swapcol r"))


      -- global shortcuts (pass to app)
      hl.bind("SUPER + F10", hl.dsp.pass({ window = [==[class:^(com\.obsproject\.Studio)$]==] }))
      hl.bind("SUPER + F9",  hl.dsp.pass({ window = [==[class:^(com\.obsproject\.Studio)$]==] }))
      hl.bind("SUPER + F4",  hl.dsp.pass({ window = [==[class:^(com\.obsproject\.Studio)$]==] }))
      hl.bind(mainMod .. " + Insert", hl.dsp.pass({ window = [==[class:^(discordcanary)$]==] }))
      hl.bind(mainMod .. " + Home",   hl.dsp.pass({ window = [==[class:^(discordcanary)$]==] }))

      -- hyprbars
      --[=[
      hl.config({
        plugin = {
          hyprbars = {
            bar_height = 30,
            bar_color = "rgb(303447)",
            ["col.text"] = "rgb(99D1DB)",
            bar_text_size = 12,
            bar_text_font = "Iosevka Nerd Font Bold",
            bar_button_padding = 12,
            bar_padding = 5,
            bar_precedence_over_border = false,
            bar_part_of_window = true,
          },
        },
      })
      --]=]
    '';
  };
}
