{ inputs, pkgs, config, ... }:
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
      wallpaper = ../../../assets/wallpapers/strawHats.png;
      wallpaperBackground = {
        blur = true;
      };
      wallpaperFillMode = null;
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
    # input = {
    #   mice = [
    #     {
    #       enable = true;
    #       acceleration = "default";
    #       scrollSpeed = 2;
    #     }
    #   ];
    # };
  };
}
