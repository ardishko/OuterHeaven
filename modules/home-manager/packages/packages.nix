{
  pkgs,
  inputs,
  lib,
  hostname,
  osConfig,
  config,
  ...
}:
{
  # Define your packages here and everything related.
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  home.packages =
    with pkgs;
    if (hostname == "jd" || hostname == "theseus") then
      [
        inputs.nh.packages.${pkgs.system}.default
        inputs.flux.packages.${pkgs.system}.mcman
        neovim
        unzip
        fastfetch
        parrot
        screen
        wget
        nemo
        kitty
        git
        sops
        steam-run
        ugreen-leds-cli
      ]
    else
      [
        # Define packages that derive from inputs

        inputs.nh.packages.${pkgs.system}.default
        # inputs.nix-alien.packages.${pkgs.system}.nix-alien
        inputs.shadower.packages.${pkgs.system}.shadower
        inputs.wayfreeze.packages.${pkgs.system}.wayfreeze
        inputs.sops-nix.packages.${pkgs.system}.default
        inputs.anyrun.packages.${pkgs.system}.stdin
        # inputs.tag-studio.packages.${pkgs.system}.default
        inputs.nix-gaming.packages.${pkgs.system}.viper
        inputs.nix-gaming.packages.${pkgs.system}.mo2installer

        # Over
        wget
        lutris
        neofetch
        font-manager
        htop
        killall
        steamtinkerlaunch
        appimage-run
        nerd-fonts.iosevka
        nerd-fonts.iosevka-term
        webdav
        gamemode
        davfs2
        protonup-qt
        protonup-ng
        pavucontrol
        # hyprpicker
        transmission_4-gtk
        winetricks
        protontricks
        piper
        thunderbird
        nix-init
        ffmpeg
        helvum
        krita
        lolcat
        vulkan-tools
        fastfetch
        gnupg
        wlprop
        python3
        ioquake3
        nvtopPackages.amd
        wlsunset
        pipes-rs
        cargo
        clonehero
        scanmem
        unzip
        qgnomeplatform-qt6
        qgnomeplatform
        gparted
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
        tailscale
        telegram-desktop
        # android-studio
        android-tools
        samrewritten
        zathura
        nwg-panel
        gnome-pomodoro
        premid
        nixpkgs-fmt
        nix-update
        wine-staging
        nmap
        ntfs3g
        revolt-desktop
        amdgpu_top

        # Image viewer
        satty

        nitch
        # manga reader
        mangareader

        gnome-text-editor
        bleachbit
        tailscale
        ventoy-full-qt
        ripcord
        r2modman
        qt6.qtdeclarative

        # nheko

        # file manager
        kdePackages.dolphin
        kdePackages.dolphin-plugins
        # archive manager
        kdePackages.ark
        unrar
        p7zip
        # calculator
        kdePackages.kalk
        # document viewer
        kdePackages.okular
        # screenshot tool
        kdePackages.spectacle

        nixpkgs-review
        bottom
        btop
        moonlight-qt
        pulseaudioFull
        pinentry-qt
        sidequest
        nix-index

        # zandronum
        aria2
        jp2a
        deskreen
        nixpkgs-fmt
        p7zip
        wl-clipboard
        grim
        slurp
        zoom-us
        upscayl
        mullvad-vpn
        impression
        woeusb
        reaper
        nexusmods-app
        sops
        inkscape
        vscodium-fhs
        ghex
        osu-lazer-bin
        gtop
        element-desktop
        nwg-look
        # hyprsunset
        mangohud
        discover-overlay
        goverlay
        zoom-us
        lumafly
        blockbench
        remmina
        audacity
        tartube-yt-dlp
        mission-center
        parabolic
        bs-manager
        gimp-with-plugins
        handbrake
        bottles
        kdePackages.filelight

        # (pkgs.appimageTools.wrapType2 { # or wrapType1
        #   name = "suyu";
        #   src = fetchurl {
        #     url = "https://git.suyu.dev/suyu/suyu/releases/download/v0.0.3/Suyu-Linux_x86_64.AppImage";
        #     hash = "sha256-26sWhTvB6K1i/K3fmwYg5pDIUi+7xs3dz8yVj5q7H0c=";
        #   };
        # })

        # emu
        cemu
        pcsx2
        duckstation
        rpcs3
        desmume
        azahar
        shadps4
        bsnes-hd
        nestopia-ue
        dolphin-emu
        rmg
        (callPackage ./pkgcustom/eden { })

        ungoogled-chromium

        inputs.hytale-launcher.packages.${pkgs.system}.default

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
        # (callPackage ./pkgcustom/roblox-fd {})
      ]
      ++ (lib.lists.optionals
        (
          osConfig.users.users.${config.home.username}.description == "vaporsnake"
          || osConfig.users.users.${config.home.username}.description == "liquid"
          || osConfig.users.users.${config.home.username}.description == "majima"
        )
        [
          scrcpy
          qtscrcpy
          distrobox
          vscodium-fhs
          arduino-ide
          vlc
        ]
      );

  # List of nix packages end here
  services.flatpak = {
    uninstallUnmanaged = true;
    # enable = true; # in /modules/core/packages.nix
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "org.onlyoffice.desktopeditors"
      "com.github.iwalton3.jellyfin-media-player"
      "com.stremio.Stremio"
      "dev.ftb.ftb-app"
      "io.github.sigmasd.stimulator"
      "org.vinegarhq.Sober"
      "com.modrinth.ModrinthApp"
      "com.google.AndroidStudio"
      "io.github.everestapi.Olympus"
      "com.github.tchx84.Flatseal"
      "io.mrarm.mcpelauncher"
      "camp.nook.nookdesktop"
      "org.freedesktop.Sdk/x86_64/23.08"
      "com.fightcade.Fightcade"
      "io.itch.itch"
      "io.github.Soundux"
      "net.audiorelay.AudioRelay"
      "org.kde.Platform"
      "org.freedesktop.Platform"
    ];
    # TODO add conditionally installed flatpak packages.
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };

  # scripts

  # Permitted Insecure Packages and Steam gamescope workaround found at: https://github.com/NixOS/nixpkgs/issues/162562#issuecomment-1523177264
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "ventoy-qt5-1.1.07"
        "ventoy-1.1.07"
        "qtwebengine-5.15.19"
      ];
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
