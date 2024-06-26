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
        # persist /mnt so that all the mounted drives don't get wiped upon reboot
        # "/mnt"
      ];
      users.${username} = {
        directories = [
          ".config/Ryujinx"
          ".config/dolphin-emu"
          ".config/melonDS"
          ".config/spotify"
          ".local/share/duckstation"
          ".local/share/Steam"
          ".local/share/vinegar"
          ".local/share/citra-emu"
          ".local/share/Cemu"
          ".local/share/cemu"
          ".local/share/flatpak"
          ".local/share/PrismLauncher"
          ".local/share/HotlineMiami2"
          ".local/share/HotlineMiami"
          ".local/share/Celeste"
          ".local/share/waydroid"
          ".local/share/komikku"
          ".local/share/anime-games-launcher"
          ".local/share/gvfs-metadata"
          ".local/share/Terraria"
          ".ssh"
          ".klei"
          ".thunderbird"
          ".wine"
          ".var"
          ".steam"
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
}
