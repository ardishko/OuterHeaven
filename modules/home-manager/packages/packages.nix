{
  pkgs,
  inputs,
  lib,
  hostname,
  ...
}:
{
  # Define your packages here and everything related.

  home.packages =
    with pkgs;
    if (hostname == "jd") then
      [
        inputs.nh.packages.${pkgs.system}.default
        inputs.flux.packages.${pkgs.system}.mcman
        neovim
        unzip
        fastfetch
        parrot
        screen
        wget
        cinnamon.nemo
        kitty
        git
        sops
      ]
    else
      [
        # Define packages that derive from inputs

        inputs.hyprcontrib.packages.${pkgs.system}.hyprprop
        inputs.nh.packages.${pkgs.system}.default
        # inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.mysql-workbench
        inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.gimp-with-plugins
        # inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.itch
        inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.handbrake
        inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.valent
        # inputs.nix-alien.packages.${pkgs.system}.nix-alien
        inputs.shadower.packages.${pkgs.system}.shadower
        inputs.wayfreeze.packages.${pkgs.system}.wayfreeze
        inputs.dolphin-emu.packages.${pkgs.system}.default
        inputs.sops-nix.packages.${pkgs.system}.default
        inputs.hyprpanel.packages.${pkgs.system}.default

        # inputs.polly-mc.${pkgs.system}.default
        # inputs.tag-studio.packages.${pkgs.system}.default

        # Over
        wget
        lutris
        steam-rom-manager
        neofetch
        font-manager
        gnome-photos
        easyeffects
        wlr-randr
        thefuck
        htop
        killall
        steamtinkerlaunch
        appimage-run
        nemo-fileroller
        nerdfonts
        webdav
        gamemode
        davfs2
        hollywood
        protonup-qt
        protonup-ng
        pavucontrol
        hyprpicker
        transmission_4-gtk
        libreoffice-fresh
        winetricks
        protontricks
        themechanger
        piper
        thunderbird
        nix-init
        waydroid
        rustdesk-flutter
        ffmpeg
        helvum
        krita
        lolcat
        vulkan-tools
        fastfetch
        scrcpy
        baobab
        python3Full
        gnupg
        gzdoom
        wlprop
        mate.mate-polkit
        folder-color-switcher
        ioquake3
        nvtopPackages.amd
        wlsunset
        pipes-rs
        qalculate-gtk
        cargo
        distrobox
        clonehero
        scanmem
        unzip
        bottles
        signal-desktop-beta
        qgnomeplatform-qt6
        qgnomeplatform
        gparted
        gnome-usage
        timeshift
        gnome-clocks
        gnome-sound-recorder
        wev
        clamav
        lutgen
        docker
        speedtest-cli
        gh
        gnome-calendar
        clamtk
        lazygit
        wireguard-tools
        kdenlive
        tor-browser
        evince
        tailscale
        telegram-desktop
        android-studio
        android-tools
        samrewritten
        zathura
        nwg-dock-hyprland
        gnome-pomodoro
        qrscan
        premid
        gpu-screen-recorder
        nixpkgs-fmt
        nix-update
        firewalld-gui
        gtkcord4
        wineWowPackages.full
        nmap
        ntfs3g
        revolt-desktop
        amdgpu_top
        inxi
        satty
        nitch
        komikku
        rmg
        gnome-text-editor
        bleachbit
        tailscale
        clipit
        ventoy-full
        ripcord
        r2modman
        # nomachine-client
        # nheko
        nemo-with-extensions
        libsForQt5.dolphin
        nixpkgs-review
        evince
        yambar
        swappy
        bottom
        btop
        moonlight-qt
        pulseaudioFull
        pinentry-qt
        sidequest
        nix-index
        monophony
        looking-glass-client
        libsForQt5.ark
        libsForQt5.dolphin
        # zandronum
        aria
        jp2a
        deskreen
        nixpkgs-fmt
        p7zip
        wl-clipboard
        grim
        slurp
        file-roller
        zoom-us
        upscayl
        wl-gammarelay-rs
        lmms
        mullvad-vpn
        impression
        woeusb
        reaper
        parabolic
        nexusmods-app
        stremio
        sops
        inkscape
        vscodium-fhs
        ghex
        osu-lazer-bin
        gtop
        (pkgs.appimageTools.wrapType2 { # or wrapType1
          name = "suyu";
          src = fetchurl {
            url = "https://git.suyu.dev/suyu/suyu/releases/download/v0.0.3/Suyu-Linux_x86_64.AppImage";
            hash = "sha256-26sWhTvB6K1i/K3fmwYg5pDIUi+7xs3dz8yVj5q7H0c=";
          };
          extraPkgs = pkgs: with pkgs; [ ];
        })

        # emu
        ryujinx
        cemu
        pcsx2
        duckstation
        rpcs3
        # inputs.dolphin-emu.packages.${pkgs.system}.default
        melonDS
        celeste
        xclicker

        # Override Template

        # (pkgs.<package>.overrideAttrs {
        #   src = pkgs.fetchFromGitHub {
        #     owner = "";
        #     repo = "";
        #     rev = "";
        #     sha256 = "";
        #   };
        # })

        # Custom packages
        # (callPackage ./pkgcustom/gpu-screen-recorder-gtk { })
        (callPackage ./pkgcustom/discover-overlay/default.nix { })
        # (callPackage ./pkgcustom/hyprswitch { })
        # (callPackage ./pkgcustom/video-downloader {})
        # (callPackage ./pkgcustom/vinegar { })
        # (callPackage ./pkgcustom/lime3ds {})
        # (callPackage ./pkgcustom/roblox-fd {})
        # (callPackage ../pkgcustom/nexus-mods/package.nix {})
      ];

  # List of packages end here

  # scripts

  # Permitted Insecure Packages and Steam gamescope workaround found at: https://github.com/NixOS/nixpkgs/issues/162562#issuecomment-1523177264
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-25.9.0"
        "python-2.7.18.7"
        "python-2.7.18.8"
        "electron-19.1.9"
      ];
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "davinci-resolve" ];
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
