{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 14;
    };
    theme = {
      name = "catppuccin-frappe-sky-compact+normal";
      package = pkgs.catppuccin-gtk.override {
        variant = "frappe";
        accents = [ "sky" ];
        size = "compact";
        tweaks = [ "normal" ];
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };

    # Where we define the cursor

    cursorTheme = {
      name = "${config.home.pointerCursor.name}";
      package = config.home.pointerCursor.package;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  xdg.configFile."gtkrc-2.0" = {
    text = "gtk-alternative-button-order = 1\n";
    force = true;
  };
  xdg.configFile."gtkrc" = {
    text = "# Not sure what's supposed to be here. Ok KDE Plasma.\n";
    force = true;
  };
}
