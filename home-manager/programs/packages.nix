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
    inputs.nix-gaming.packages.${pkgs.system}.proton-ge

    #inputs.ags.packages.${pkgs.system}.default
    #   inputs.nixpkgs-stable.legacyPackages.x86_64-linux.davinci-resolve
    # Over
    wget
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
    #wineWowPackages.wayland
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
    gnome.pomodoro
    ytui-music
    youtube-tui
    qrscan
    premid
    gpu-screen-recorder-gtk
    gpu-screen-recorder
    nixpkgs-fmt
    nix-update
    firewalld-gui
    sherlock
    element-desktop
    gtkcord4
    wine-staging
    nmap
    valent
    ntfs3g
    revolt-desktop
    vinegar
    parsec-bin
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
    # Desktop Entry overrides

    (pkgs.vesktop.overrideAttrs {
      desktopItems = [
        (makeDesktopItem {
          name = "vencorddesktop";
          desktopName = "Discord";
          exec = "mullvad-exclude vencorddesktop";
          icon = "discord";
          startupWMClass = "VencordDesktop";
          genericName = "Internet Messenger";
          keywords = ["discord" "vencord" "electron" "chat"];
          categories = ["Network" "InstantMessaging" "Chat"];
        })
      ];
    })

    # (pkgs.vinegar.overrideAttrs {
    #   desktopItem = [
    #     (makeDesktopItem {
    #       name = "roblox-player";
    #       desktopName = "Roblox Player";
    #       exec = "mullvad-exclude gamescope -W 2560 -H 1440 --force-grab-cursor --force-windows-fullscreen vinegar player";
    #       icon = "discord";
    #       startupWMClass = "VencordDesktop";
    #       genericName = "Internet Messenger";
    #       keywords = ["discord" "vencord" "electron" "chat"];
    #       categories = ["Network" "InstantMessging" "Chat"];
    #   ];
    # })

    (pkgs.obsidian.overrideAttrs {
      desktopItem = [
        (makeDesktopItem {
          name = "obsidian";
          desktopName = "Obsidian";
          comment = "Knowledge base";
          icon = "obsidian";
          exec = "obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland";
          categories = ["Office"];
          mimeTypes = ["x-scheme-handler/obsidian"];
        })
      ];
    })

    # (pkgs.steam.overrideAttrs {
    #   desktopItem = [
    #     (makeDesktopItem {
    #       name = "Steam";
    #       desktopName = "Steam";
    #       icon = "steam";
    #       exec = "mullvad-exclude steam";
    #     })
    #   ];
    # })
    # Custom packages
    #(callPackage ../pkgcustom/vinegar-alt {})
    #(callPackage ../pkgcustom/sgdboop {})
    #(callPackage ../pkgcustom/sgdboop/default.nix {})

    #(callPackage ../pkgcustom/discover-overlay/default.nix {})
  ];

  # List of packages end here
  xdg.desktopEntries = {
    roblox-app = lib.mkForce {
      name = "Roblox Packed";
      type = "Application";
      icon = "grapejuice-roblox-player";
      terminal = false;
      exec = "mullvad-exclude gamescope -W 2560 -H 1440 --force-grab-cursor --force-windows-fullscreen vinegar player";
    };
    neovim = lib.mkForce {
      name = "Neovim";
      type = "Application";
      mimeType = ["text/plain"];

      icon = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/NotAShelf/neovim-flake/main/assets/neovim-flake-logo-work.svg";
        sha256 = "19n7n9xafyak35pkn4cww0s5db2cr97yz78w5ppbcp9jvxw6yyz3";
      };
      exec = "kitty nvim";
    };
  };

  # xdg.desktopEntries.comms = lib.mkForce {
  #   name = "Comms";
  #   type = "Application";
  #   icon = "discord";
  #   terminal = false;
  #   exec = "vencorddesktop";
  #   exec = "cinny";
  # };

  # scripts

  # Permitted Insecure Packages and Steam gamescope workaround found at: https://github.com/NixOS/nixpkgs/issues/162562#issuecomment-1523177264
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-25.9.0"
        "python-2.7.18.7"
      ];
      allowUnfree = true;
      allowBroken = true;
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
