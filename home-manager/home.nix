{
  config,
  pkgs,
  self,
  user,
  inputs,
  ...
}: {
  home.username = "vaporsnake";
  home.homeDirectory = "/home/vaporsnake";

  # Here is where we make inputs available within home manager
  #	homeConfigurations.vaporsnake = inputs.home-manager.lib.homeManagerConfiguration {
  #  pkgs = [
  #	import inputs.nixpkgs {
  #          config.allowUnfree = true;
  #  	}
  #	];

  #  modules = ...;

  #  extraSpecialArgs = {inherit inputs;};
  #}
  gtk = {
    enable = true;
    font.name = "Iosevka Nerd Font 14";
    theme = {
      name = "Catppuccin-Frappe-Compact-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = "frappe";
        accents = ["sky"];
        tweaks = ["normal"];
        size = "compact";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders;
    };

    # Where we define the cursor

    cursorTheme.name = "macOS-BigSur";

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
  qt = {
    enable = true;
    style = {
      name = "catppuccin-kvantum";
      package = pkgs.catppuccin-kvantum;
    };
    platformTheme = "gtk3";
  };
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS-BigSur";
    size = 24;
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # The dconf lines are needed for QEMU virtualization.
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
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
    thefuck = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "ardishco";
      userEmail = "ardishco@protonmail.com";
    };
  };

  imports = [
    ./programs
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
