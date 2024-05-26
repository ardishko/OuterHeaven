{ inputs, username, ... }:
{
  imports = [ inputs.impermanence.nixosModule ];
  environment.persistence = {
    "/persist" = {
      files = [
        "/etc/machine-id"
      ];
      directories = [
        "/var/log"
        "/var/lib/bluetooth"
        "/var/lib/nixos"
        "/var/lib/systemd/coredump"
        "/etc/NetworkManager/system-connections"
        # persist /mnt so that all the mounted drives don't get wiped upon reboot
        "/mnt"
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
}
