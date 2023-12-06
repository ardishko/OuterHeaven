{
  pkgs,
  inputs,
  lib,
  ...
}: {
  # Define your packages here and everything related.
  home.packages = with pkgs; [
    # Define packages that derive from inputs

    inputs.hyprcontrib.packages.${pkgs.system}.hyprprop
    inputs.nh.packages.${pkgs.system}.default
    inputs.ags.packages.${pkgs.system}.default
    #   inputs.nixpkgs-stable.legacyPackages.x86_64-linux.davinci-resolve
    # Over
    wget
    obsidian
    lutris
    steam-rom-manager
    bluez-tools
    neofetch
    swaynotificationcenter
    font-manager
    gnome-photos
    easyeffects
    swaybg
    swayosd
    obs-studio
    obsidian
    wlr-randr
    wlogout
    thefuck
    htop
    killall
    steamtinkerlaunch
    prismlauncher-qt5
    appimage-run
    cinnamon.nemo-fileroller
    gnome.file-roller
    nerdfonts
    webdav
    gamemode
    davfs2
    hollywood
    protonup-qt
    protonup-ng
    pavucontrol
    hyprpicker
    swappy
    eww-wayland
    transmission-gtk
    sway-contrib.grimshot
    libreoffice-fresh
    wineWowPackages.wayland
    winetricks
    protontricks
    soundux
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    themechanger
    piper
    thunderbird
    mangohud
    nix-init
    waydroid
    celluloid
    rustdesk
    tartube-yt-dlp
    ffmpeg
    helvum
    virt-manager
    krita
    gimp-with-plugins
    droidcam
    lolcat
    cinny-desktop
    vulkan-tools
    fastfetch
    android-tools
    scrcpy
    baobab
    python3Full
    gnupg
    mangohud
    firefox
    gzdoom
    wlprop
    mate.mate-polkit
    cinnamon.folder-color-switcher
    libsForQt5.qtstyleplugins
    apple-cursor
    ioquake3
    nvtop-amd
    wlsunset
    pipes-rs
    qalculate-gtk
    cargo
    distrobox
    wf-recorder
    clonehero
    scanmem
    cinnamon.nemo-with-extensions
    unzip
    bless
    handbrake
    mullvad-vpn
    monero-gui
    heroic-unwrapped
    bottles-unwrapped
    woeusb-ng
    ungoogled-chromium
    signal-desktop-beta
    emacs-nox
    qgnomeplatform-qt6
    qgnomeplatform
    gparted
    gnome-usage
    signal-desktop
    timeshift
    watershot
    gnome.gnome-clocks
    gnome.gnome-sound-recorder
    wev
    clamav
    lutgen
    docker
    speedtest-cli
    grim
    wl-clipboard
    gh
    gnome.gnome-calendar
    clamtk
    lazygit
    yazi
    almanah
    wireguard-tools
    komikku
    kdenlive
    tor-browser
    neovim-unwrapped
    blender
    evince
    tailscale
    telegram-desktop
    android-studio
    samrewritten
    zathura
    nwg-dock-hyprland
    # Overrides

    (pkgs.goverlay.overrideAttrs {
      # cock
      src = pkgs.fetchFromGitHub {
        owner = "benjamimgois";
        repo = "goverlay";
        rev = "0.9.1";
        sha256 = "sha256-jLnWdywS398qu6lU0RMZ1cC3KM9dH9uWizuJZa7gahE";
      };
    })

    (pkgs.flameshot.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        owner = "flameshot-org";
        repo = "flameshot";
        rev = "fa29bcb4279b374ea7753fc4a514fd705499f7e7";
        sha256 = "sha256-XIquratzK4qW0Q1ZYI5X6HIrnx1kTTFxeYeR7hjrpjQ=";
      };
      cmakeFlags = [
        "-DUSE_WAYLAND_GRIM=True"
        "-DUSE_WAYLAND_CLIPBOARD=1"
      ];
      buildInputs = with pkgs; [libsForQt5.kguiaddons];
    })

    (pkgs.swaylock-effects.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        owner = "jirutka";
        repo = "swaylock-effects";
        rev = "dd9db0efbdf85c4c9116644d4b5fbee6c1c27e90";
        hash = "sha256-/ixrlCn9cvhE0h0rUfYO8fsy3dThfNAttYB6fYo27EI=";
      };
    })

    (pkgs.r2modman.overrideAttrs {
      src = fetchFromGitHub {
        owner = "ebkr";
        repo = "r2modmanPlus";
        rev = "v3.1.45";
        hash = "sha256-6o6iPDKKqCzt7H0a64HGTvEvwO6hjRh1Drl8o4x+4ew=";
      };
    })
    (pkgs.vesktop.overrideAttrs {
      desktopItems = [
        (makeDesktopItem {
          name = "vencorddesktop";
          desktopName = "Discord";
          exec = "vencorddesktop %U";
          icon = "discord";
          startupWMClass = "VencordDesktop";
          genericName = "Internet Messenger";
          keywords = ["discord" "vencord" "electron" "chat"];
          categories = ["Network" "InstantMessaging" "Chat"];
        })
      ];
    })
    # Custom desktop entries

    #(pkgs.gpu-screen-recorder-gtk.overrideAttrs {
    #  src = pkgs.fetchgit {
    #    url = "https://repo.dec05eba.com/gpu-screen-recorder-gtk";
    #    rev = "6ebe8fb2a9c838e076286d960b3ef3c9482433b3";
    #    sha256 = "sha256-6ELq07fZAwlJN6AJTMffQ69bGaQ2FGThPbamQRvxrK4=";
    #  };
    # })

    #	(pkgs.gpu-screen-recorder.overrideAttrs {
    #	  src = pkgs.fetchgit {
    #	    url = "https://repo.dec05eba.com/gpu-screen-recorder";
    #	    rev = "cd6105fe10aa0761f4b0bd107947c81b2a5a2cc9";
    #	    sha256 = "sha256-ROjydeuV+TL8VXAC/LRWJWJgGica+O/xW3RcuMselRc";
    #	  };
    #	 })

    # Custom packages

    #(callPackage ../pkgcustom/vesktop/vesktop.nix {})
    (callPackage ../pkgcustom/vinegar {})
    #(callPackage ../pkgcustom/sgdboop/default.nix {})
    #(callPackage ../pkgcustom/discover-overlay/default.nix {})

    (pkgs.appimageTools.wrapType2 {
      # or wrapType1
      name = "premid";
      src = fetchurl {
        url = "https://github.com/PreMiD/Linux/releases/download/v2.3.2/PreMiD-Portable.AppImage";
        hash = "sha256-wYlNpc68IuE594AODHNkGIZfQtPEcsdnzJRlD7nsPLI=";
      };
    })
  ];

  # List of packages end here
  xdg.desktopEntries.roblox-app = lib.mkForce {
    name = "Roblox Packed";
    type = "Application";
    icon = "grapejuice-roblox-player";
    terminal = false;
    exec = "gamescope -W 2560 -H 1440 --force-grab-cursor --force-windows-fullscreen vinegar player";
  };

  # Permitted Insecure Packages and Steam gamescope workaround found at: https://github.com/NixOS/nixpkgs/issues/162562#issuecomment-1523177264
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-24.8.6"
        "python-2.7.18.7"
      ];
      allowUnfree = true;
      packageOverrides = pkgs: {
        steam = pkgs.steam.override {
          extraPkgs = pkgs:
            with pkgs; [
              xorg.libXcursor
              xorg.libXi
              xorg.libXinerama
              xorg.libXScrnSaver
              libpng
              libpulseaudio
              libvorbis
              stdenv.cc.cc.lib
              libkrb5
              keyutils
              libgdiplus
              at-spi2-atk
              fmodex
              gtk3
              gtk3-x11
              harfbuzz
              icu
              glxinfo
              inetutils
              libthai
              mono5
              pango
              strace
              zlib
              libunwind
            ];
        };
      };
    };
  };
  # Declaratively Manage Flatpaks here
  services.flatpak = {
    packages = [
      "org.kde.Platform"
      "org.freedesktop.Platform.GL.default"
      "org.kde.Platform.Locale"
      "org.freedesktop.Platform.openh264"
      "org.gnome.Platform"
      "org.freedesktop.Platform.Compat.i386"
      "org.freedesktop.Platform"
      "com.github.tchx84.Flatseal"
      "com.librumreader.librum"
      "com.steamgriddb.SGDBoop"
      "org.ryujinx.Ryujinx"
      "org.yuzu_emu.yuzu"
      "org.freedesktop.Platform.ffmpeg-full"
      "io.mrarm.mcpelauncher"
      "net.rpcs3.RPCS3"
    ];
  };

  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];
}
