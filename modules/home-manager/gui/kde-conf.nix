{
  inputs,
  pkgs,
  config,
  osConfig,
  ...
}:
let
  hostName = osConfig.networking.hostName;
  # Per-host kwinrc values
  kwinHosts = {
    ShadowMoses = {
      desktopUuid = "c511f381-96f0-4508-93be-d15d732001cb";
      tilingUuid = "74a7097a-326d-5707-b685-fbfdc2c45852";
      xwaylandScale = "1.25";
      extraSections = "";
    };
    BigShell = {
      desktopUuid = "89e8127f-df9b-4b69-9b0c-2ccd3301fad7";
      tilingUuid = "fc8b1433-8104-59d8-88f2-eb27dd82efa8";
      xwaylandScale = "1.25";
      extraSections = "";
    };
    Tanker = {
      desktopUuid = "cc545412-cdc5-4a1e-b501-211ab7d324aa";
      tilingUuid = "81edfc82-a00b-55ff-9f47-4f822d9988d4";
      xwaylandScale = "1";
      extraSections = "";
    };
    Kamurocho = {
      desktopUuid = "c511f381-96f0-4508-93be-d15d732001cb";
      tilingUuid = "74a7097a-326d-5707-b685-fbfdc2c45852";
      xwaylandScale = "1.25";
      extraSections = ''

        [Compositing]
        TearingPreventionType=1
        UseBufferAge=true

        [Wayland]
        EglUseBufferAge=true
      '';
    };
  };

  kwin = kwinHosts.${hostName} or kwinHosts.ShadowMoses;
in
{
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];
  home.packages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ "frappe" ];
      accents = [ "sky" ];
    })
  ];
  programs.plasma = {
    enable = true;
    overrideConfig = true;
    resetFilesExclude = [
      "plasma-org.kde.plasma.desktop-appletsrc"
    ];
    # Panels are declared via xdg.configFile."plasma-org.kde.plasma.desktop-appletsrc"
    # below — the panels option in plasma-manager doesn't work reliably.
    powerdevil = {
      battery = {
        dimDisplay.enable = true;
        displayBrightness = 60;
      };
      AC = {
        dimDisplay = {
          enable = !(hostName == "ShadowMoses" || hostName == "Kamurocho");
          idleTimeout = if (hostName == "ShadowMoses" || hostName == "Kamurocho") then null else 4000;
        };
        powerProfile =
          if (hostName == "ShadowMoses" || hostName == "Kamurocho") then
            "performance"
          else if (hostName == "Tanker") then
            "powerSaving"
          else
            "balanced";
      };
    };
    kwin = {
      # nightLight = {
      #   enable = true;
      #   mode = "times";
      #   temperature = { day = 5800; night = 4600; };
      #   time = { morning = "06:30"; evening = "19:00"; };
      # };
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
      colorScheme = "CatppuccinFrappeSky";
      wallpaper = ../../../assets/wallpapers/haha.jpg;
      wallpaperBackground.blur = true;
      wallpaperFillMode = "tile";
      cursor = {
        theme = "${config.home.pointerCursor.name}";
        size = config.home.pointerCursor.size;
      };
      iconTheme = "${config.gtk.iconTheme.name}";
    };
    kscreenlocker.appearance.wallpaper = ../../../assets/wallpapers/idolGoro.jpg;
    fonts.general = {
      family = "${config.gtk.font.name}";
      pointSize = config.gtk.font.size;
    };
    input.keyboard = {
      layouts = [
        { layout = "tr"; }
        { layout = "se"; }
        { layout = "lv"; }
      ];
      numlockOnStartup = "on";
    };
    spectacle.shortcuts = {
      captureRectangularRegion = "Print";
      captureCurrentMonitor = "Ctrl+Print";
      captureActiveWindow = "Shift+Print";
    };

    #  Unbind KRunner
    shortcuts.krunner = {
      "RunClipboard" = "none";
      "Run Command" = "none";
      "Run Command on Clipboard Contents" = "none";
    };
    shortcuts.plasmashell = {
      "show dashboard" = "none";
    };
    krunner.shortcuts = {
      launch = null;
      runCommandOnClipboard = null;
    };

    #  Anyrun launcher
    # Uncomment to bind Ctrl+Escape to anyrun:
    # hotkeys.commands.launch-anyrun = {
    #   name = "Launch Anyrun";
    #   key = "Ctrl+Escape";
    #   command = "anyrun";
    # };

    #  Flameshot
    # To use flameshot instead of spectacle, comment out the spectacle
    # shortcuts above and uncomment this block:
    # spectacle.shortcuts = {
    #   captureRectangularRegion = "none";
    #   captureCurrentMonitor = "none";
    #   captureActiveWindow = "none";
    # };
    # hotkeys.commands.flameshot-gui = {
    #   name = "Flameshot Screenshot";
    #   key = "Print";
    #   command = "flameshot gui";
    # };
    # hotkeys.commands.flameshot-full = {
    #   name = "Flameshot Full Screen";
    #   key = "Ctrl+Print";
    #   command = "flameshot full";
    # };
  };

  # here's the taskbar, it's seriously annoying to declare. I hate how stateful plasma is
  xdg.configFile."plasma-org.kde.plasma.desktop-appletsrc" = {
    text = ''
      [ActionPlugins][0]
      MiddleButton;NoModifier=org.kde.paste
      RightButton;NoModifier=org.kde.contextmenu

      [ActionPlugins][1]
      RightButton;NoModifier=org.kde.contextmenu

      [Containments][2]
      activityId=
      formfactor=2
      immutability=1
      lastScreen=0
      location=4
      plugin=org.kde.panel
      wallpaperplugin=org.kde.image

      [Containments][2][Applets][3]
      immutability=1
      plugin=org.kde.plasma.kickoff

      [Containments][2][Applets][3][Configuration]
      PreloadWeight=100
      popupHeight=573
      popupWidth=781

      [Containments][2][Applets][3][Configuration][General]
      favoritesPortedToKAstats=true

      [Containments][2][Applets][4]
      immutability=1
      plugin=org.kde.plasma.pager

      [Containments][2][Applets][5]
      immutability=1
      plugin=org.kde.plasma.icontasks

      [Containments][2][Applets][5][Configuration][General]
      launchers=applications:zen-twilight.desktop,applications:vesktop.desktop,applications:steam.desktop,applications:dev.zed.Zed.desktop,applications:signal.desktop,applications:com.mitchellh.ghostty.desktop,applications:feishin.desktop

      [Containments][2][Applets][6]
      immutability=1
      plugin=org.kde.plasma.marginsseparator

      [Containments][2][Applets][7]
      activityId=
      formfactor=0
      immutability=1
      lastScreen=-1
      location=0
      plugin=org.kde.plasma.systemtray
      popupHeight=432
      popupWidth=432
      wallpaperplugin=org.kde.image

      [Containments][2][Applets][7][Applets][8]
      immutability=1
      plugin=org.kde.plasma.clipboard

      [Containments][2][Applets][7][Applets][9]
      immutability=1
      plugin=org.kde.plasma.cameraindicator

      [Containments][2][Applets][7][Applets][10]
      immutability=1
      plugin=org.kde.plasma.manage-inputmethod

      [Containments][2][Applets][7][Applets][11]
      immutability=1
      plugin=org.kde.plasma.keyboardlayout

      [Containments][2][Applets][7][Applets][12]
      immutability=1
      plugin=org.kde.kdeconnect

      [Containments][2][Applets][7][Applets][13]
      immutability=1
      plugin=org.kde.plasma.devicenotifier

      [Containments][2][Applets][7][Applets][14]
      immutability=1
      plugin=org.kde.plasma.notifications

      [Containments][2][Applets][7][Applets][15]
      immutability=1
      plugin=org.kde.kscreen

      [Containments][2][Applets][7][Applets][16]
      immutability=1
      plugin=org.kde.plasma.networkmanagement

      [Containments][2][Applets][7][Applets][17]
      immutability=1
      plugin=org.kde.plasma.keyboardindicator

      [Containments][2][Applets][7][Applets][18]
      immutability=1
      plugin=org.kde.plasma.printmanager

      [Containments][2][Applets][7][Applets][19]
      immutability=1
      plugin=org.kde.plasma.weather

      [Containments][2][Applets][7][Applets][20]
      immutability=1
      plugin=org.kde.plasma.volume

      [Containments][2][Applets][7][Applets][20][Configuration][General]
      migrated=true

      [Containments][2][Applets][7][Applets][23]
      immutability=1
      plugin=org.kde.plasma.brightness

      [Containments][2][Applets][7][Applets][24]
      immutability=1
      plugin=org.kde.plasma.battery

      [Containments][2][Applets][7][Applets][25]
      immutability=1
      plugin=org.kde.plasma.bluetooth

      [Containments][2][Applets][7][Applets][25][Configuration]
      PreloadWeight=55

      [Containments][2][Applets][7][Applets][26]
      immutability=1
      plugin=org.kde.plasma.mediacontroller

      [Containments][2][Applets][21]
      immutability=1
      plugin=org.kde.plasma.digitalclock

      [Containments][2][Applets][21][Configuration]
      popupHeight=550
      popupWidth=770

      [Containments][2][Applets][22]
      immutability=1
      plugin=org.kde.plasma.showdesktop

      [Containments][2][Applets][27]
      immutability=1
      plugin=org.kde.plasma.systemmonitor.cpu

      [Containments][2][Applets][27][Configuration]
      CurrentPreset=org.kde.plasma.systemmonitor
      PreloadWeight=60
      popupHeight=270
      popupWidth=180

      [Containments][2][Applets][27][Configuration][Appearance]
      chartFace=org.kde.ksysguard.piechart
      title=Total CPU Use

      [Containments][2][Applets][27][Configuration][SensorColors]
      cpu/all/usage=153,209,219

      [Containments][2][Applets][27][Configuration][Sensors]
      highPrioritySensorIds=["cpu/all/usage"]
      lowPrioritySensorIds=["cpu/all/cpuCount","cpu/all/coreCount"]
      totalSensors=["cpu/all/usage"]

      [Containments][2][Applets][28]
      immutability=1
      plugin=org.kde.plasma.systemmonitor.memory

      [Containments][2][Applets][28][Configuration]
      CurrentPreset=org.kde.plasma.systemmonitor
      PreloadWeight=55
      popupHeight=214
      popupWidth=318

      [Containments][2][Applets][28][Configuration][Appearance]
      chartFace=org.kde.ksysguard.piechart
      title=Memory Usage

      [Containments][2][Applets][28][Configuration][SensorColors]
      memory/physical/used=153,209,219

      [Containments][2][Applets][28][Configuration][Sensors]
      highPrioritySensorIds=["memory/physical/used"]
      lowPrioritySensorIds=["memory/physical/total"]
      totalSensors=["memory/physical/usedPercent"]

      [Containments][2][General]
      AppletOrder=3;4;5;6;7;27;28;21;22
      thickness=60
    '';
    force = true;
  };

  # kwinrc: per-host display settings
  xdg.configFile."kwinrc" = {
    text = ''
      [Desktops]
      Id_1=${kwin.desktopUuid}
      Number=1
      Rows=1

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

      [Tiling][${kwin.tilingUuid}]
      tiles={"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}

      [Xwayland]
      Scale=${kwin.xwaylandScale}
    ''
    + kwin.extraSections;
    force = true;
  };

  # kdeglobals: Catppuccin Frappe Sky colors
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
