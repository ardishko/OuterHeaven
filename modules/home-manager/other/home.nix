{
  pkgs,
  username,
  lib,
  config,
  ...
}:
{
  home = {
    username = "${username}";
    homeDirectory = lib.mkForce "/home/${username}";
    activation = {
      deleteOnActivation = lib.hm.dag.entryBefore [ "writeBoundary" ] ''
        if [ -f "/home/${username}/.config/kdeglobals" ]; then
          rm -f "/home/${username}/.config/kdeglobals"
        fi

        if [ -f "/home/${username}/.config/kcminputrc" ]; then
          rm -f "/home/${username}/.config/kcminputrc"
        fi

        if [ -f "/home/${username}/.config/kwinrc" ]; then
          rm -f "/home/${username}/.config/kwinrc"
        fi

        if [ -f "/home/${username}/.gtkrc-2.0" ]; then
          rm -f "/home/${username}/.gtkrc-2.0"
        fi

        if [ -f "/home/${username}/.config/mimeapps.list" ]; then
          rm -f "/home/${username}/.config/mimeapps.list"
        fi
      '';
    };
  };
  # home-manager.backupFileExtension = "backup";

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

  # remember to set the cursor size in the hyprland conf if you decide to change it
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.frappeDark;
    name = "catppuccin-frappe-dark-cursors";
    size = 24;
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

  # The dconf lines are needed for QEMU virtualization.
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Enable "services"
  services = {
    syncthing = {
      enable = true;
    };
  };
  # Enable "programs"
  programs = {
    git = {
      enable = true;
      userName = "ardishco";
      userEmail = "ardishco@protonmail.com";
    };
  };
}
