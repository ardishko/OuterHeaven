{
  inputs,
  username,
  hostname,
  lib,
  ...
}:
{
  imports = [ inputs.impermanence.nixosModule ];
  boot.tmp.cleanOnBoot = true;
  environment.persistence = {
    "/persist" = {
      files = [ /* "/etc/machine-id */ ];
      directories =
        if (hostname == "jd") then
          [
            "/var/log"
            "/var/lib/systemd/coredump"
            "/etc/NetworkManager/system-connections"
            "/etc/mullvad-vpn"
            "/etc/backups"
            "/etc/cred"
            "/var/lib/nixos-containers"
            "/etc/nixos-containers"
            "/var/lib/tailscale" # tailscale
            "/var/lib/bitwarden_rs" # vaultwarden
            "/var/lib/bitwarden-backup"
            "/var/lib/nextcloud" # nextcloud
            "/var/lib/redis-nitter" # nitter
            "/var/lib/parrot" # parrot
            "/var/lib/jellyfin" # jellyfin
            "/var/lib/playit" # playit
            "/var/lib/palworld" # palworld
          ]
        else
          [
            "/var/log"
            "/var/lib/bluetooth"
            "/var/lib/systemd/coredump"
            "/etc/NetworkManager/system-connections"
            "/var/lib/flatpak"
            "/var/lib/waydroid"
            "/etc/mullvad-vpn"
            "/etc/cosmic-comp"
            "/var/lib/nixos"
            # persist /mnt so that all the mounted drives don't get wiped upon reboot
            # "/mnt"
          ] ++ (lib.lists.optionals (hostname == "Tanker") [
            "/var/lib/decky-loader"
          ]);
      users.${username} = {
        directories =
          if (hostname == "jd") then
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
              ".config/Ryujinx"
              ".config/dolphin-emu"
              ".config/melonDS"
              ".config/PCSX2"
              ".config/Cemu"
              ".config/spotify"
              ".config/ags"
              ".config/rpcs3"
              ".config/r2modman"
              ".config/r2modmanPlus-local"
              ".config/sops"
              ".config/vesktop"
              ".config/Vencord"
              ".config/StardewValley"
              ".config/VA_11_Hall_A"
              ".config/nuclearthrone"
              ".config/Signal Beta"
              ".config/noisetorch"
              ".config/Mullvad VPN"
              ".config/nheko"
              ".config/obs-studio"
              ".config/steam-rom-manager"
              ".config/cosmic"
              ".config/deadbolt_game"
              ".config/obsidian"
              ".config/heroic"
              ".config/Vampire_Survivors"
              ".config/Vampire_Survivors_Data"
              ".config/Vampire_Survivors_97277776"
              ".local/share/bottles"
              ".local/state/syncthing"
              ".local/state/wireplumber"
              ".local/share/nheko"
              ".local/share/lutris"
              ".local/share/Danganronpa2"
              ".local/share/StardewValley"
              ".local/share/duckstation"
              ".local/share/Steam"
              ".local/share/vinegar"
              ".local/share/citra-emu"
              ".local/share/Cemu"
              ".local/share/flatpak"
              ".local/share/PrismLauncher"
              ".local/share/PollyMC"
              ".local/share/HotlineMiami2"
              ".local/share/HotlineMiami"
              ".local/share/Celeste"
              ".local/share/waydroid"
              ".local/share/komikku"
              ".local/share/anime-games-launcher"
              ".local/share/sleepy-launcher"
              ".local/share/gvfs-metadata"
              ".local/share/Terraria"
              ".local/share/DaVinciResolve"
              ".local/share/Smart Code ltd"
              ".local/share/nemo"
              ".local/share/osu"
              ".ssh"
              ".klei"
              ".thunderbird"
              ".wine"
              ".var"
              ".steam"
              ".ftba"
              ".minecraft"
              ".stremio-server"
              ".mozilla"
              ".mullvad"
              ".factorio"
              ".zplug"
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
              "homebrew" # (this is for deckyloader)
              # TO DO: Yuzu/Sudachi dirs, vencord/vesktop declarative configuration, .config/Mullvad VPN, nemo
            ];
          files = [
            ".zsh_history"
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
    "/home/${username}" = lib.mkForce {
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
    ${username} = {
      hashedPasswordFile = "/persist/passwords/user";
      initialPassword = "nutsitch";
    };
    root = {
      hashedPasswordFile = "/persist/passwords/root";
    };
    # echo abcdef | mkpasswd -s
  };
}
