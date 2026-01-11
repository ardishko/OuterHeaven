{
  inputs,
  config,
  lib,
  ...
}:
let
  userName =
    if (config.networking.hostName == "ShadowMoses") then
      "vaporsnake"
    else if (config.networking.hostName == "BigShell") then
      "liquid"
    else if (config.networking.hostName == "Tanker") then
      "raiden"
    else if (config.networking.hostName == "jd" || config.networking.hostName == "theseus") then
      "snake"
    else if (config.networking.hostName == "Kamurocho") then
      "majima"
    else
      "user";
in
{
  imports = [ inputs.impermanence.nixosModule ];
  boot.tmp.cleanOnBoot = true;
  environment.persistence = {
    "/persist" = {
      files = [
        # "/etc/machine-id
      ];
      hideMounts = true;
      directories =
        if (config.networking.hostName == "jd" || config.networking.hostName == "theseus") then
          [
            "/var/log"
            "/var/lib/systemd/coredump"
            "/etc/NetworkManager/system-connections"
            "/etc/mullvad-vpn"
            "/etc/backups"
            "/etc/cred"
            "/var/lib/nixos-containers"
            "/var/lib/nixos"
            "/etc/nixos-containers"
            "/var/lib/tailscale" # tailscale
            "/var/lib/bitwarden_rs" # vaultwarden
            "/var/lib/bitwarden-backup"
            "/var/lib/nextcloud" # nextcloud
            "/var/lib/redis-nextcloud" # redis nextcloud
            "/var/lib/redis-immich" # redis immich
            "/var/lib/redis-nitter" # nitter
            "/var/lib/parrot" # parrot
            "/var/lib/jellyfin" # jellyfin
            "/var/cache/jellyfin" # jellyfin cache
            "/var/lib/radarr"
            "/var/lib/recyclarr"
            "/var/lib/readarr"
            "/var/lib/sonarr"
            "/var/lib/playit" # playit
            "/var/lib/postgresql" # postgresql
            "/var/lib/palworld" # palworld
            "/var/lib/fail2ban" # fail2ban
            "/var/lib/grafana" # grafana
            "/var/lib/prometheus2"
            "/var/lib/loki"
            "/var/lib/promtail"
            "/var/log/nginx" # nginx logs
            "/var/log/caddy" # caddy logs
            "/etc/ssh"
            # immich
            {
              directory = "/var/lib/immich";
              user = "immich";
              group = "immich";
              mode = "0755";
            }
            # pufferpanel
            {
              directory = "/var/lib/pufferpanel";
              user = "pufferpanel";
              group = "pufferpanel";
              mode = "0755";
            }
            {
              directory = "/disks/media";
              user = "jellyfin";
              group = "media";
              mode = "02775";
            }
            {
              directory = "/disks/media/Movies";
              user = "jellyfin";
              group = "media";
              mode = "02775";
            }
            {
              directory = "/disks/media/Shows";
              user = "jellyfin";
              group = "media";
              mode = "02775";
            }
            {
              directory = "/disks/media/Books";
              user = "jellyfin";
              group = "media";
              mode = "02775";
            }
            {
              directory = "/disks/media/";
              user = "jellyfin";
              group = "media";
              mode = "02775";
            }
          ]
        else
          [
            "/var/lib/libvirt"
            "/var/log"
            "/var/lib/bluetooth"
            "/var/lib/systemd/coredump"
            "/etc/NetworkManager/system-connections"
            "/var/lib/flatpak"
            "/var/lib/waydroid"
            "/etc/mullvad-vpn"
            "/etc/cosmic-comp"
            "/var/lib/nixos"
            "/var/lib/tailscale" # tailscale
            "/var/lib/containers" # podman / docker / distrobox I think?
            "/var/lib/sddm"
            "/etc/ssh"
          ]
          ++ (lib.lists.optionals (config.networking.hostName == "Tanker") [
            "/var/lib/decky-loader"
          ]);
      users.${userName} = {
        directories =
          if (config.networking.hostName == "jd" || config.networking.hostName == "theseus") then
            [
              ".config/Mullvad VPN"
              ".config/sops"
              ".local/state/syncthing"
              ".local/share/Steam"
              "Backups"
              ".ssh"
              "NixOS"
            ]
          else
            [
              ".cache/spotify"
              ".config/unity3d"
              ".config/spotify"
              ".config/gzdoom"
              ".config/ags"
              ".config/r2modman"
              ".config/r2modmanPlus-local"
              ".config/sops"
              ".config/quickshell"
              ".config/vesktop"
              ".config/Vencord"
              ".config/StardewValley"
              ".config/VA_11_Hall_A"
              ".config/nuclearthrone"
              ".config/Signal Beta"
              ".config/Signal"
              ".config/noisetorch"
              ".config/Mullvad VPN"
              ".config/nheko"
              ".config/obs-studio"
              ".config/cosmic"
              ".config/deadbolt_game"
              ".config/obsidian"
              ".config/flameshot"
              ".config/heroic"
              ".config/Vampire_Survivors"
              ".config/Vampire_Survivors_Data"
              ".config/Vampire_Survivors_97277776"
              ".config/celeste"
              ".config/Element"
              ".config/discord"
              ".config/nemo"
              ".config/PreMiD"
              ".config/electron-mail"
              ".config/MangoHud"
              ".config/steamtinkerlaunch"
              ".config/mangareader"
              # blender
              ".config/blender"
              # rclone
              ".config/rclone"
              # polychromatic
              ".config/polychromatic"
              # gtk
              ".config/gtk-4.0"
              ".config/gtk-3.0"
              # remmina remote desktop client
              ".config/remmina"
              ".local/share/remmina"
              # vscodiıum
              ".config/VSCodium"
              # zed editor
              ".config/zed"
              ".local/share/zed"
              # vlc media player
              ".config/vlc"
              ".local/share/vlc"
              # tartube
              ".config/tartube"
              # nextcloud desktop client
              ".config/Nextcloud"
              ".local/share/Nextcloud"
              # discover discord overlay
              ".config/discover_overlay"
              # ALVR
              ".config/alvr"
              # youtube music desktop application
              ".config/YouTube Music Desktop App"
              # beat saber
              ".config/bs-manager"
              # jellyfin client
              ".config/jellyfin.org"
              ".config/autostart"
              # transmission
              ".config/transmission"
              # easyeffects
              ".config/easyeffects"
              ".local/share/easyeffects"
              # sddm
              ".local/share/sddm"
              # KDE retardation
              ".local/share/kactivitymanagerd"
              ".local/share/kscreen"
              ".local/share/dolphin"
              ".config/kdedefaults"
              ".local/share/bottles"
              ".local/state/syncthing"
              ".local/state/wireplumber"
              ".local/share/nheko"
              ".local/share/lutris"
              ".local/share/applications"
              ".local/share/Danganronpa2"
              ".local/share/StardewValley"
              ".local/share/Steam"
              ".local/share/vinegar"
              ".local/share/flatpak"
              ".local/share/PrismLauncher"
              ".local/share/PollyMC"
              ".local/share/HotlineMiami2"
              ".local/share/HotlineMiami"
              ".local/share/Celeste"
              ".local/share/NexusMods.App"
              ".local/share/waydroid"
              ".local/share/gvfs-metadata"
              ".local/share/Terraria"
              ".local/share/DaVinciResolve"
              ".local/share/Smart Code ltd"
              ".local/share/nemo"
              ".local/share/nvf"
              ".local/share/vulkan"
              ".local/share/osu"
              ".local/share/containers"
              ".local/share/kwalletd"
              ".local/share/okular"
              ".local/share/TelegramDesktop"
              ".local/share/BSManager"
              ".local/share/Jellyfin Media Player"
              ".local/share/jellyfinmediaplayer"
              ".cache/waydroid_script"
              # the home directory lol
              ".ssh"
              ".klei"
              ".thunderbird"
              ".wine"
              ".var"
              ".steam"
              ".ftba"
              ".minecraft"
              ".mozilla"
              ".zen"
              ".mullvad"
              ".factorio"
              ".zplug"
              ".android"
              ".prefs"
              "Backups"
              "Downloads"
              "Desktop"
              "Documents"
              "Extracto"
              "Games"
              "Github"
              "Music"
              "NixOS"
              "Notes"
              "Personal"
              "Pictures"
              "Programs"
              "Public"
              "Videos"
              #
              "Zomboid"
              "aspyr-media"

              # hd2 arsenal
              ".config/hd2arsenal"
              ## Emulators
              # not really an emulator but...
              # Steam ROM Manager
              ".config/steam-rom-manager"

              # Eden
              ".config/eden"
              ".local/share/eden"

              # Azahar
              ".local/share/azahar-emu"
              ".config/azahar-emu"

              # rpcs3
              ".config/rpcs3"

              # duckstation
              ".local/share/duckstation"
              ".config/duckstation"

              # dolphin emulator
              ".config/dolphin-emu"
              ".local/share/dolphin-emu"

              # desmume
              ".config/desmume"

              # PCSX2
              ".config/PCSX2"

              # Cemu
              ".config/Cemu"
              ".local/share/Cemu"

              # RMG (Nintendo 64) (Rosalie's Mupen GUI)
              ".local/share/RMG"
              ".config/RMG"

              # Nestopia UE (NES)
              ".config/nestopia"
              ".local/share/nestopia"

              # bsnes (SNES)
              ".config/bsnes-hd beta"

              ## KDE Related stuff
              ## KDE Team why are you like this
              ".config/KDE"
              ".config/kde.org"
              ".config/plasma-workspace"
              ".config/xsettingsd"
              ".kde"
            ]
            ++ (lib.lists.optionals (config.networking.hostName == "Tanker") [
              "homebrew" # this is for deckyloader
            ]);
        files = [
          ".zsh_history"
          ## Mane wtf is wrong wit u KDE Plasma team
          ".config/powerdevilrc"
          ".config/akregatorrc"
          ".config/baloofileinformationrc"
          ".config/baloofilerc"
          ".config/bluedevilglobalrc"
          ".config/device_automounter_kcmrc"
          ".config/dolphinrc"
          ".config/filetypesrc"
          ".config/gwenviewrc"
          ".config/kactivitymanagerd-pluginsrc"
          ".config/kactivitymanagerd-statsrc"
          ".config/kactivitymanagerd-switcher"
          ".config/kactivitymanagerdrc"
          ".config/katemetainfos"
          ".config/katerc"
          ".config/kateschemarc"
          ".config/katevirc"
          ".config/kcmfonts"
          ".config/kconf_updaterc"
          ".config/kded5rc"
          ".config/kgammarc"
          ".config/kglobalshortcutsrc"
          ".config/khotkeysrc"
          ".config/kmixrc"
          ".config/konsolerc"
          ".config/kscreenlockerrc"
          ".config/ksmserverrc"
          ".config/ksplashrc"
          ".config/ktimezonedrc"
          ".config/kwinrulesrc"
          ".config/kxkbrc"
          ".config/partitionmanagerrc"
          ".config/plasma-localerc"
          ".config/plasma-nm"
          ".config/plasma-org.kde.plasma.desktop-appletsrc"
          ".config/plasmanotifyrc"
          ".config/plasmarc"
          ".config/plasmashellrc"
          ".config/PlasmaUserFeedback"
          ".config/plasmawindowed-appletsrc"
          ".config/plasmawindowedrc"
          ".config/powermanagementprofilesrc"
          ".config/spectaclerc"
          ".config/startkderc"
          ".config/systemsettingsrc"
          ".config/kwalletrc"
          ".config/okularrc"
          ".config/trashrc"
          ".local/state/mpv/watch_history.jsonl"
          ".local/share/krunnerstaterc"
          ".local/share/user-places.xbel"
        ];
      };
    };
  };
  # set persist fs as neededForBoot
  fileSystems = {
    "/" = lib.mkForce {
      device = "tmpfs";
      fsType = "tmpfs";
      neededForBoot = true;
      options = [
        "defaults"
        "size=5G"
        "mode=755"
      ];
    };
    "/home/${userName}" = lib.mkForce {
      device = "tmpfs";
      fsType = "tmpfs";
      neededForBoot = true;
      options = [
        "defaults"
        "size=5G"
        "mode=777"
      ];
    };
    "/persist".neededForBoot = true;
    "/persist/cache".neededForBoot = true;
  };
  users.users = {
    ${userName} = {
      hashedPasswordFile = "/persist/passwords/user";
      initialPassword = "nutsitch";
    };
    root = {
      hashedPasswordFile = "/persist/passwords/root";
    };
    # echo abcdef | mkpasswd -s
  };
}
