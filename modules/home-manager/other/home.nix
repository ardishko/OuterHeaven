{
  username,
  lib,
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
        if [ -f "/home/${username}/.config/user-dirs.dirs" ]; then
          rm -f "/home/${username}/.config/user-dirs.dirs"
        fi
        if [ -f "/home/${username}/.local/share/recently-used.xbel" ]; then
          rm -f "/home/${username}/.local/share/recently-used.xbel"
        fi
      '';
    };
  };
  # home-manager.backupFileExtension = "backup";

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

  # Enable "programs"
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "ardishco";
          email = "ardishco@protonmail.com";
        };
      };
    };
  };
}
