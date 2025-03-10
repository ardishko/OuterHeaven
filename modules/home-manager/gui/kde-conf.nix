{
  inputs,
  pkgs,
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
    powerdevil = {
      battery = {
        dimDisplay = {
          enable = true;
        };
        displayBrightness = 60;
      };
      AC = {
        dimDisplay = {
          enable = true;
          idleTimeout = 4000;
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
          day = 5500;
          night = 5000;
        };
        time = {
          morning = "06:30";
          evening = "18:00";
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
  xdg.configFile."kdeglobals".text = ''
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
  xdg.configFile."kcminputrc".text = ''
    [Keyboard]
    NumLock=0

    [Mouse]
    cursorSize=24
    cursorTheme=catppuccin-frappe-dark-cursors
  '';
  # here are the display settings. I hate that there aren't options for this. plasma-manager is half baked. Well, okay. Maybe not half baked but probably 70% of the way there. Also, I left this note early before I do the configuration.

}
