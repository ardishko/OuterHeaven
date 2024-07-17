{ inputs, username, lib, ... }:
{
  imports = [ inputs.impermanence.nixosModule ];
  boot.tmp.cleanOnBoot = true;
  environment.persistence = {
    "/persist" = {
      files = [
        "/etc/machine-id"
      ];
      directories = [
        "/var/log"
        "/var/lib/bluetooth"
        "/var/lib/systemd/coredump"
        "/etc/NetworkManager/system-connections"
        "/var/lib/flatpak"
        "/var/lib/waydroid"
        # persist /mnt so that all the mounted drives don't get wiped upon reboot
        # "/mnt"
      ];
      users.${username} = {
        directories = [
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
          ".local/share/HotlineMiami2"
          ".local/share/HotlineMiami"
          ".local/share/Celeste"
          ".local/share/waydroid"
          ".local/share/komikku"
          ".local/share/anime-games-launcher"
          ".local/share/sleepy-launcher"
          ".local/share/gvfs-metadata"
          ".local/share/Terraria"
          ".ssh"
          ".klei"
          ".thunderbird"
          ".wine"
          ".var"
          ".steam"
          ".mozilla"
          ".mullvad"
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
  };
}
