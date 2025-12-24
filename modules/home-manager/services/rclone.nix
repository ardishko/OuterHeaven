{ config, pkgs, ... }:
{
  programs.rclone = {
    enable = true;

    remotes = {
      nextcloud = {
        config = {
          type = "webdav";
          url = "https://nextcloud.ardishco.net/remote.php/dav/files/Quiet";
          vendor = "nextcloud";
        };
        secrets = {
          user = "/persist/passwords/nextcloud-user";
          pass = "/persist/passwords/nextcloud-pass";
        };

        mounts = {
          "Documents/TSI" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/Documents/TSI";
          };

          "Sync/EmuSaves/Cemu/saves" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/usr/save";
          };

          "Sync/EmuSaves/Cemu/sys-title" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/sys/title";
          };

          "Sync/EmuSaves/Cemu/usr-title" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/usr/title";
          };

          "Sync/EmuSaves/Eden/keys" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/eden/keys";
          };

          "Sync/EmuSaves/Eden/system-save" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/eden/nand/system/save";
          };

          "Sync/EmuSaves/Eden/user-save" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/eden/nand/user/save";
          };

          "Sync/EmuSaves/RPCS3/saves" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.config/rpcs3/dev_hdd0/home/00000001/savedata";
          };

          "Sync/EmuSaves/RPCS3/trophy" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.config/rpcs3/dev_hdd0/home/00000001/trophy";
          };

          "Sync/EmuSaves/Dolphin/GC" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/dolphin-emu/GC";
          };

          "Sync/EmuSaves/Dolphin/Wii" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/dolphin-emu/Wii";
          };

          "Sync/EmuSaves/Dolphin/StateSaves" = {
            enable = true;
            mountPoint = "${config.home.homeDirectory}/.local/share/dolphin-emu/StateSaves";
          };
        };
      };
    };
  };
}
