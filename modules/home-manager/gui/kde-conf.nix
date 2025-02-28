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
          day = 4500;
          night = 2500;
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
}
