{
  inputs,
  pkgs,
  lib,
  config,
  osConfig,
  ...
}:
{
  imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
  home.packages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ "frappe" ];
      accents = [ "sky" ];
    })
  ];
  programs.plasma = {
    enable = true;
    panels = [
      {
        floating = false;
        location = "bottom";
      }
    ];
    powerdevil = {
      battery = {
        dimDisplay = {
          enable = true;
        };
        displayBrightness = 60;
      };
      AC = {
        dimDisplay = {
          enable = if (osConfig.networking.hostName == "ShadowMoses") then false else true;
          idleTimeout = if (osConfig.networking.hostName == "ShadowMoses") then null else 4000;
        };
        powerProfile =
          if (osConfig.networking.hostName == "ShadowMoses") then
            "performance"
          else if (osConfig.networking.hostName == "BigShell") then
            "balanced"
          else if (osConfig.networking.hostName == "Tanker") then
            "powerSaving"
          else
            "balanced";
      };
    };
    kwin = {
      nightLight = {
        enable = true;
        mode = "times";
        temperature = {
          day = 2800;
          night = 1900;
        };
        time = {
          morning = "06:30";
          evening = "19:00";
        };
      };
      effects = {
        windowOpenClose.animation = "off";
        desktopSwitching.animation = "off";
        minimization.animation = "off";
        shakeCursor.enable = true;
      };
    };
    workspace = {
      theme = "default";
      lookAndFeel = "Catppuccin-Frappe-Sky";
      colorScheme = "CatppuccinFrappeBlue";
      # wallpaper = ../../../assets/wallpapers/strawHats.png;
      wallpaperBackground = {
        blur = true;
      };
      wallpaperFillMode = "tile";
      cursor = {
        theme = "${config.home.pointerCursor.name}";
        size = config.home.pointerCursor.size;
      };
      iconTheme = "${config.gtk.iconTheme.name}";
    };
    kscreenlocker = {
      appearance = {
        wallpaper = ../../../assets/wallpapers/idolGoro.jpg;
      };
    };
    fonts = {
      general = {
        family = "${config.gtk.font.name}";
        pointSize = config.gtk.font.size;
      };
    };
    input = {
      keyboard = {
        numlockOnStartup = "on";
      };
    };
    spectacle = {
      shortcuts = {
        captureRectangularRegion = "Print";
        captureCurrentMonitor = "Ctrl+Print";
        captureActiveWindow = "Shift+Print";
        recordRegion = "F8";
        recordWindow = "Shift+F8";
      };
    };
    # startup = {
    #   desktopScript = {
    #     "hey-listen" = {
    #       postCommands = "
    #
    #       ";
    #     };
    #   };
    # };
  };
  # Stupid fucking force arguments.
  # xdg.configFile."kdeglobals".text.force = true;
  # xdg.configFile."kcminputrc".text.force = true;
  # xdg.configFile."kwinrc".text.force = true;
  # xdg.configFile."user-dirs.dirs".text.force = true;
  # xdg.configFile."user-dirs.locale".text.force = true;
  # xdg.configFile."gtkrc-2.0".text.force = true;
  # xdg.configFile."gtkrc".text.force = true;
  # xdg.configFile."Trolltech.conf".text.force = true;

  #
  xdg.configFile."kdeglobals" = {
    text = ''
      [ColorEffects:Disabled]
      ChangeSelectionColor=
      Color=48, 52, 70
      ColorAmount=0.30000000000000004
      ColorEffect=2
      ContrastAmount=0.1
      ContrastEffect=0
      Enable=
      IntensityAmount=-1
      IntensityEffect=0

      [ColorEffects:Inactive]
      ChangeSelectionColor=true
      Color=48, 52, 70
      ColorAmount=0.5
      ColorEffect=3
      ContrastAmount=0
      ContrastEffect=0
      Enable=true
      IntensityAmount=0
      IntensityEffect=0

      [Colors:Button]
      BackgroundAlternate=153,209,219
      BackgroundNormal=65, 69, 89
      DecorationFocus=153,209,219
      DecorationHover=65, 69, 89
      ForegroundActive=239, 159, 118
      ForegroundInactive=165, 173, 206
      ForegroundLink=153,209,219
      ForegroundNegative=231, 130, 132
      ForegroundNeutral=229, 200, 144
      ForegroundNormal=198, 208, 245
      ForegroundPositive=166, 209, 137
      ForegroundVisited=202, 158, 230

      [Colors:Complementary]
      BackgroundAlternate=35, 38, 52
      BackgroundNormal=41, 44, 60
      DecorationFocus=153,209,219
      DecorationHover=65, 69, 89
      ForegroundActive=239, 159, 118
      ForegroundInactive=165, 173, 206
      ForegroundLink=153,209,219
      ForegroundNegative=231, 130, 132
      ForegroundNeutral=229, 200, 144
      ForegroundNormal=198, 208, 245
      ForegroundPositive=166, 209, 137
      ForegroundVisited=202, 158, 230

      [Colors:Header]
      BackgroundAlternate=35, 38, 52
      BackgroundNormal=41, 44, 60
      DecorationFocus=153,209,219
      DecorationHover=65, 69, 89
      ForegroundActive=239, 159, 118
      ForegroundInactive=165, 173, 206
      ForegroundLink=153,209,219
      ForegroundNegative=231, 130, 132
      ForegroundNeutral=229, 200, 144
      ForegroundNormal=198, 208, 245
      ForegroundPositive=166, 209, 137
      ForegroundVisited=202, 158, 230

      [Colors:Selection]
      BackgroundAlternate=153,209,219
      BackgroundNormal=153,209,219
      DecorationFocus=153,209,219
      DecorationHover=65, 69, 89
      ForegroundActive=239, 159, 118
      ForegroundInactive=41, 44, 60
      ForegroundLink=153,209,219
      ForegroundNegative=231, 130, 132
      ForegroundNeutral=229, 200, 144
      ForegroundNormal=35, 38, 52
      ForegroundPositive=166, 209, 137
      ForegroundVisited=202, 158, 230

      [Colors:Tooltip]
      BackgroundAlternate=27,25,35
      BackgroundNormal=48, 52, 70
      DecorationFocus=153,209,219
      DecorationHover=65, 69, 89
      ForegroundActive=239, 159, 118
      ForegroundInactive=165, 173, 206
      ForegroundLink=153,209,219
      ForegroundNegative=231, 130, 132
      ForegroundNeutral=229, 200, 144
      ForegroundNormal=198, 208, 245
      ForegroundPositive=166, 209, 137
      ForegroundVisited=202, 158, 230

      [Colors:View]
      BackgroundAlternate=41, 44, 60
      BackgroundNormal=48, 52, 70
      DecorationFocus=153,209,219
      DecorationHover=65, 69, 89
      ForegroundActive=239, 159, 118
      ForegroundInactive=165, 173, 206
      ForegroundLink=153,209,219
      ForegroundNegative=231, 130, 132
      ForegroundNeutral=229, 200, 144
      ForegroundNormal=198, 208, 245
      ForegroundPositive=166, 209, 137
      ForegroundVisited=202, 158, 230

      [Colors:Window]
      BackgroundAlternate=35, 38, 52
      BackgroundNormal=41, 44, 60
      DecorationFocus=153,209,219
      DecorationHover=65, 69, 89
      ForegroundActive=239, 159, 118
      ForegroundInactive=165, 173, 206
      ForegroundLink=153,209,219
      ForegroundNegative=231, 130, 132
      ForegroundNeutral=229, 200, 144
      ForegroundNormal=198, 208, 245
      ForegroundPositive=166, 209, 137
      ForegroundVisited=202, 158, 230

      [General]
      ColorSchemeHash=f13a5f93a8d2186748a87eaf56ec9fcef24073d5
      font=Iosevka Nerd Font,14,-1,5,400,0,0,0,0,0,0,0,0,0,0,1

      [Icons]
      Theme=Papirus-Dark

      [KDE]
      LookAndFeelPackage=Catppuccin-Frappe-Sky

      [WM]
      activeBackground=48,52,70
      activeBlend=198,208,245
      activeForeground=198,208,245
      inactiveBackground=35,38,52
      inactiveBlend=165,173,206
      inactiveForeground=165,173,206
    '';
    force = true;
  };
  xdg.configFile."kcminputrc" = {
    text = ''
      [Keyboard]
      NumLock=0

      [Mouse]
      cursorSize=24
      cursorTheme=catppuccin-frappe-dark-cursors
    '';
    force = true;
  };
  # here are the display settings. I hate that there aren't options for this. plasma-manager is half baked. Well, okay. Maybe not half baked but probably 70% of the way there. Also, I left this note early before I do the configuration.
  xdg.configFile."kwinrc" = {
    text =
      if (osConfig.networking.hostName == "ShadowMoses") then
        ''
          [Desktops]
          Id_1=c511f381-96f0-4508-93be-d15d732001cb
          Number=1
          Rows=1

          [NightColor]
          Active=true
          DayTemperature=2800
          EveningBeginFixed=1900
          Mode=Times
          MorningBeginFixed=0630
          NightTemperature=1900

          [Plugins]
          fadeEnabled=false
          fadedesktopEnabled=false
          glideEnabled=false
          magiclampEnabled=false
          scaleEnabled=false
          shakecursorEnabled=true
          slideEnabled=false
          squashEnabled=false

          [Tiling]
          padding=4

          [Tiling][74a7097a-326d-5707-b685-fbfdc2c45852]
          tiles={"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}

          [Xwayland]
          Scale=1.25
        ''
      else if (osConfig.networking.hostName == "BigShell") then
        ''
          [Desktops]
          Id_1=89e8127f-df9b-4b69-9b0c-2ccd3301fad7
          Number=1
          Rows=1

          [NightColor]
          Active=true
          DayTemperature=5500
          EveningBeginFixed=1800
          Mode=Times
          MorningBeginFixed=0630
          NightTemperature=5000

          [Plugins]
          fadeEnabled=false
          fadedesktopEnabled=false
          glideEnabled=false
          magiclampEnabled=false
          scaleEnabled=false
          shakecursorEnabled=true
          slideEnabled=false
          squashEnabled=false

          [Tiling]
          padding=4

          [Tiling][fc8b1433-8104-59d8-88f2-eb27dd82efa8]
          tiles={"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}

          [Xwayland]
          Scale=1.25
        ''
      else if (osConfig.networking.hostName == "Tanker") then
        ''
          [Desktops]
          Id_1=cc545412-cdc5-4a1e-b501-211ab7d324aa
          Number=1
          Rows=1

          [NightColor]
          Active=true
          DayTemperature=4500
          EveningBeginFixed=1800
          Mode=Times
          MorningBeginFixed=0630
          NightTemperature=2500

          [Plugins]
          fadeEnabled=false
          fadedesktopEnabled=false
          glideEnabled=false
          magiclampEnabled=false
          scaleEnabled=false
          shakecursorEnabled=true
          slideEnabled=false
          squashEnabled=false

          [Tiling]
          padding=4

          [Tiling][81edfc82-a00b-55ff-9f47-4f822d9988d4]
          tiles={"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}

          [Xwayland]
          Scale=1
        ''
      else
        null;
    force = true;
  };
  xdg.configFile."user-dirs.dirs" = {
    text = ''
      # This file is written by xdg-user-dirs-update
      # If you want to change or add directories, just edit the line you're
      # interested in. All local changes will be retained on the next run.
      # Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
      # homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
      # absolute path. No other format is supported.
      # 
      XDG_DESKTOP_DIR="$HOME/Desktop"
      XDG_DOWNLOAD_DIR="$HOME/Downloads"
      XDG_TEMPLATES_DIR="$HOME/Templates"
      XDG_PUBLICSHARE_DIR="$HOME/Public"
      XDG_DOCUMENTS_DIR="$HOME/Documents"
      XDG_MUSIC_DIR="$HOME/Music"
      XDG_PICTURES_DIR="$HOME/Pictures"
      XDG_VIDEOS_DIR="$HOME/Videos"
    '';
    force = true;
  };
  xdg.configFile."user-dirs.locale" = {
    text = ''
      en_US
    '';
    force = true;
  };
  xdg.configFile."gtkrc-2.0" = {
    text = ''
      gtk-alternative-button-order = 1
    '';
    force = true;
  };
  xdg.configFile."gtkrc" = {
    text = ''
      # Not sure what's supposed to be here. Ok KDE Plasma.
    '';
    force = true;
  };
  xdg.configFile."Trolltech.conf" = {
    text = ''
      [qt]
      GUIEffects=none
      KDE\contrast=7
      KWinPalette\activeBackground=#303446
      KWinPalette\activeBlend=#c6d0f5
      KWinPalette\activeForeground=#c6d0f5
      KWinPalette\activeTitleBtnBg=#292c3c
      KWinPalette\frame=#292c3c
      KWinPalette\inactiveBackground=#232634
      KWinPalette\inactiveBlend=#a5adce
      KWinPalette\inactiveForeground=#a5adce
      KWinPalette\inactiveFrame=#303446
      KWinPalette\inactiveTitleBtnBg=#303446
      Palette\active=#c6d0f5, #414559, #464b66, #393d54, #14151d, #232634, #c6d0f5, #c6d0f5, #c6d0f5, #303446, #292c3c, #0e1015, #99d1db, #232634, #99d1db, #ca9ee6, #292c3c, #c6d0f5, #303446, #c6d0f5, #a5adce, #99d1db
      Palette\disabled=#99a1c1, #3c4053, #474d68, #3b3f56, #15171f, #252836, #99a1c1, #a5adce, #99a1c1, #303446, #2b2e3f, #0f1016, #2b2e3f, #99a1c1, #7aa2ae, #9c7eb6, #2b2e3f, #c6d0f5, #303446, #c6d0f5, #8289a5, #2b2e3f
      Palette\inactive=#858ba5, #323648, #4b516d, #3f445c, #171922, #292d3c, #858ba5, #c6d0f5, #858ba5, #303446, #303446, #111219, #353a4d, #858ba5, #7589aa, #7d7b8e, #303446, #c6d0f5, #303446, #c6d0f5, #757c9b, #353a4d
      font="Iosevka Nerd Font,14,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
    '';
    force = true;
  };
}
