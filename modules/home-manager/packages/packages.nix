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
        inputs.nix-gaming.packages.${pkgs.system}.viper
        inputs.nix-gaming.packages.${pkgs.system}.mo2installer
        inputs.fluxer-nix.packages.${pkgs.system}.fluxer
        inputs.scopebuddy.packages.${pkgs.system}.default

        # Over
        wget
        lutris
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
        pavucontrol
        transmission_4-gtk
        nicotine-plus
        winetricks
        protontricks
        piper
        thunderbird
        nix-init
        ffmpeg
        krita
        lolcat
        vulkan-tools
        fastfetch
        nitch
        gnupg
        wlprop
        python3
        nvtopPackages.amd
        cargo
        scanmem
        unzip
        gparted
        gnome-clocks
        gnome-sound-recorder
        wev
        lutgen
        docker
        speedtest-cli
        gh
        wireguard-tools
        tailscale
        telegram-desktop
        # android-studio
        android-tools
        samrewritten
        zathura
        nwg-panel
        gnome-pomodoro
        nixpkgs-fmt
        nix-update
        wine-staging
        nmap
        ntfs3g
        revolt-desktop
        amdgpu_top

        # Image viewer
        kdePackages.gwenview

        # manga reader
        mangareader

        gnome-text-editor
        tailscale
        ventoy-full-qt
        ripcord
        qt6.qtdeclarative

        # modding
        r2modman
        beammp-launcher
        balatro-mod-manager
        hedgemodmanager
        scarab
        olympus

        # feishin navidrome
        feishin

        # file manager
        kdePackages.dolphin
        kdePackages.dolphin-plugins
        nautilus

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
        sops
        inkscape
        vscodium-fhs
        ghex
        osu-lazer-bin
        element-desktop
        nwg-look
        # hyprsunset
        mangohud
        discover-overlay
        goverlay
        zoom-us
        blockbench
        remmina
        audacity
        tartube-yt-dlp
        resources
        parabolic
        bs-manager
        gimp-with-plugins
        handbrake
        bottles
        baobab
        plezy
        keepassxc
        # (pkgs.appimageTools.wrapType2 { # or wrapType1
        #   name = "suyu";
        #   src = fetchurl {
        #     url = "https://git.suyu.dev/suyu/suyu/releases/download/v0.0.3/Suyu-Linux_x86_64.AppImage";
        #     hash = "sha256-26sWhTvB6K1i/K3fmwYg5pDIUi+7xs3dz8yVj5q7H0c=";
        #   };
        # })
        # game related shit
        inputs.unstable.legacyPackages.${pkgs.system}.faugus-launcher
        inputs.unstable.legacyPackages.${pkgs.system}.protonplus
        # emu
        cemu
        pcsx2
        # duckstation
        desmume
        azahar
        shadps4
        bsnes-hd
        nestopia-ue
        dolphin-emu
        inputs.unstable.legacyPackages.${pkgs.system}.eden
        rpcs3
        # inputs.hytale-launcher.packages.${pkgs.system}.default
        # gonna fix this one ^

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
        (callPackage ./pkgcustom/kame-editor { })
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
          vlc
        ]
      )
      ++ (lib.lists.optionals (osConfig.users.users.${config.home.username}.description == "liquid") [
        framework-tool
        framework-tool-tui
      ]);

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
      "com.stremio.Stremio"
      "io.github.wivrn.wivrn"
      "org.onlyoffice.desktopeditors"
      "dev.ftb.ftb-app"
      "io.github.sigmasd.stimulator"
      "org.vinegarhq.Sober"
      "com.modrinth.ModrinthApp"
      "com.google.AndroidStudio"
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
      rec {
        appId = "io.github.Amethyst.ModManager";
        sha256 = "sha256-WiGVIi2G9WdqZCGI/PjpjeHh2pD349hW1mtOJrMFUOY=";
        bundle = "${pkgs.fetchurl {
          url = "https://github.com/ChrisDKN/Amethyst-Mod-Manager/releases/download/v1.3.11/AmethystModManager.flatpak";
          inherit sha256;
        }}";
      }
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
}
