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
    inputs.anime-games.packages.${pkgs.system}.honkers-railway-launcher
      #inputs.ags.packages.${pkgs.system}.default
    #   inputs.nixpkgs-stable.legacyPackages.x86_64-linux.davinci-resolve
    # Over
    wget
    lutris
    steam-rom-manager 
    neofetch
    swaynotificationcenter
    font-manager
    gnome-photos
    easyeffects
    swaybg
    swayosd
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
    lolcat
    cinny-desktop
    vulkan-tools
    fastfetch
    scrcpy
    baobab
    python3Full
    gnupg
    mangohud
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
    monero-gui
    heroic
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
    parsec-bin
    amdgpu_top
    floorp
    mullvad-vpn
    inxi
    satty
    nitch
    komikku
    mysql-workbench
    gtklock
    # Overrides

    # (pkgs.komikku.overrideAttrs {
    #   src = pkgs.fetchFromGitLab {
    #     owner = "valos";
    #     repo = "Komikku";
    #     rev = "v1.24.2";
    #     hash = "sha256-c00JRy1K/jYoQYNAMSm6lQkuGQXZv/2liV1F4jpg+C4=";
    #   };
    # })
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

    # (pkgs.mullvad-vpn.overrideAttrs {
    #   src = fetchurl {
    #     url = "https://github.com/mullvad/mullvadvpn-app/releases/download/2023.3/MullvadVPN-2023.3_amd64.deb";
    #     sha256 = "sha256-+XK9xUeSs93egmtsQ7qATug/n9taeQkmc4ZgObPYvn4=";
    #   };
    # })

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
          name = "vesktop";
          desktopName = "Discord";
          exec = "mullvad-exclude vesktop --enable-gpu --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
          icon = "discord";
          startupWMClass = "VencordDesktop";
          genericName = "Internet Messenger";
          keywords = ["discord" "vencord" "electron" "chat"];
          categories = ["Network" "InstantMessaging" "Chat"];
        })
      ];
    })

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
    (callPackage ../pkgcustom/vinegar {})
    (callPackage ../pkgcustom/pdiary {})
    #(callPackage ../pkgcustom/nexus-mods/package.nix {})
    #(callPackage ../pkgcustom/sgdboop {})
    #(callPackage ../pkgcustom/sgdboop/default.nix {})

    #(callPackage ../pkgcustom/discover-overlay/default.nix {})
  ];

  # List of packages end here
  xdg.desktopEntries = {
    "org.prismlauncher.PrismLauncher" = lib.mkForce {
      name = "Prism Launcher";
      type = "Application";
      icon = "org.prismlauncher.PrismLauncher";
      terminal = false;
      exec = "mullvad-exclude prismlauncher %u";
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
