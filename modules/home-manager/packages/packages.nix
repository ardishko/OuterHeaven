{
  pkgs,
  inputs,
  lib,
  hostname,
  ...
}:
{
  # Define your packages here and everything related.
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

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
        nemo
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
        inputs.anyrun.packages.${pkgs.system}.stdin
        # inputs.polly-mc.${pkgs.system}.default
        # inputs.tag-studio.packages.${pkgs.system}.default
        inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.bottles
        inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.nwg-dock-hyprland
        inputs.hyprswitch.packages.${pkgs.system}.hyprswitch
        inputs.quickshell.packages.${pkgs.system}.default
        inputs.nix-gaming.packages.${pkgs.system}.viper
        inputs.nix-gaming.packages.${pkgs.system}.mo2installer

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
        nerd-fonts.iosevka
        nerd-fonts.iosevka-term
        webdav
        gamemode
        davfs2
        # hollywood
        protonup-qt
        protonup-ng
        pavucontrol
        hyprpicker
        transmission_4-gtk
        libreoffice-fresh
        winetricks
        protontricks
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
        wlprop
        mate.mate-polkit
        folder-color-switcher
        ioquake3
        nvtopPackages.amd
        wlsunset
        pipes-rs
        cargo
        distrobox
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
        evince
        tailscale
        telegram-desktop
        # android-studio
        android-tools
        samrewritten
        zathura
        nwg-panel
        gnome-pomodoro
        qrscan
        # premid
        gpu-screen-recorder
        nixpkgs-fmt
        nix-update
        firewalld-gui
        gtkcord4
        wine-staging
        nmap
        ntfs3g
        revolt-desktop
        amdgpu_top
        inxi

        # Image viewer
        satty

        nitch
        # manga reader
        mangareader

        gnome-text-editor
        bleachbit
        tailscale
        ventoy-full
        ripcord
        r2modman
        qt6.qtdeclarative

        # nheko

        # file manager
        libsForQt5.dolphin
        libsForQt5.dolphin-plugins
        # archive manager
        kdePackages.ark
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
        aria
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
        parabolic
        nexusmods-app
        stremio
        sops
        inkscape
        vscodium-fhs
        ghex
        osu-lazer-bin
        gtop
        element-desktop
        nwg-look
        electron-mail
        hyprsunset
        mangohud
        discover-overlay
        goverlay
        zoom-us
        gpt4all
        lumafly

        # resources
        # clipboard-jh
        # (pkgs.appimageTools.wrapType2 { # or wrapType1
        #   name = "suyu";
        #   src = fetchurl {
        #     url = "https://git.suyu.dev/suyu/suyu/releases/download/v0.0.3/Suyu-Linux_x86_64.AppImage";
        #     hash = "sha256-26sWhTvB6K1i/K3fmwYg5pDIUi+7xs3dz8yVj5q7H0c=";
        #   };
        # })

        # emu
        ryujinx
        cemu
        pcsx2
        duckstation
        rpcs3
        # inputs.dolphin-emu.packages.${pkgs.system}.default
        melonDS
        celeste

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
      ];

  # List of nix packages end here
  services.flatpak = {
    uninstallUnmanaged = false;
    # enable = true; # in /modules/core/packages.nix
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      # FUCK THE SOBER DEVELOPERS FOR MAKING THIS SO GODDAMN HARD OH MY GOD. I ACTUALLY WANTED TO KILL MYSELF WHILE TRYING TO INSTALL THIS SHIT DECLARATIVELY FOR FUCKS SAKE
      # GOD. FUCK. GOD FUCKING DAMN IT. MOTHERFUCKER. THE SOBER WEBSITE DEVELOPERS CAN SHOVE A DRAGON DILDO UP THEIR FUCKING ASS.
      # I HAVE SO MANY OTHER THINGS I WANNA SAY HERE BUT I HAVE TO HOLD BACK. GODDAMN IT.
      {
        flatpakref = "https://sober.vinegarhq.org/sober.flatpakref";
        sha256 = "sha256:1pj8y1xhiwgbnhrr3yr3ybpfis9slrl73i0b1lc9q89vhip6ym2l";
      }
      "net.shadps4.shadPS4"
      "org.kde.kdenlive"
      "com.google.AndroidStudio"
      "io.github.everestapi.Olympus"
      "com.github.Rosalie241.RMG"
      "com.github.tchx84.Flatseal"
      "com.steamgriddb.SGDBoop"
      "io.mrarm.mcpelauncher"
      "camp.nook.nookdesktop"
      "org.freedesktop.Sdk/x86_64/23.08"
      "com.fightcade.Fightcade"
      "io.itch.itch"
      "io.github.lime3ds.Lime3DS"
      "io.github.Soundux"
      "gg.guilded.Guilded"
      "net.audiorelay.AudioRelay"
      "org.kde.Platform"
      "org.freedesktop.Platform"
    ];
    update = {
      onActivation = true;
      auto = {
        enable = true;
        onCalendar = "weekly"; # Default value
      };
    };
  };

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
