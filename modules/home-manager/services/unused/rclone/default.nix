{ config, pkgs, ... }:
{
  imports = [ ./rclone-bisync-hm-module.nix ];

  programs.rclone = {
    enable = true;
    remotes.nextcloud = {
      config = {
        type = "webdav";
        url = "fuck you you're not getting the full dav link";
        vendor = "nextcloud";
      };
      secrets = {
        user = "${config.home.homeDirectory}/.config/rclone/nextcloud-user";
        pass = "${config.home.homeDirectory}/.config/rclone/nextcloud-pass";
      };
    };
  };

  services.rclone-bisync = {
    enable = true;
    remoteName = "nextcloud";
    interval = "2min";

    paths = {
      documents = {
        local = "${config.home.homeDirectory}/Documents/TSI";
        remote = "/Documents/TSI";
      };

      cemu-saves = {
        local = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/usr/save";
        remote = "/Sync/EmuSaves/Cemu/saves";
      };

      cemu-sys = {
        local = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/sys/title";
        remote = "/Sync/EmuSaves/Cemu/sys-title";
      };

      cemu-usr = {
        local = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/usr/title";
        remote = "/Sync/EmuSaves/Cemu/usr-title";
      };

      eden-keys = {
        local = "${config.home.homeDirectory}/.local/share/eden/keys";
        remote = "/Sync/EmuSaves/Eden/keys";
      };

      eden-system = {
        local = "${config.home.homeDirectory}/.local/share/eden/nand/system/save";
        remote = "/Sync/EmuSaves/Eden/system-save";
      };

      eden-user = {
        local = "${config.home.homeDirectory}/.local/share/eden/nand/user/save";
        remote = "/Sync/EmuSaves/Eden/user-save";
      };

      rpcs3-saves = {
        local = "${config.home.homeDirectory}/.config/rpcs3/dev_hdd0/home/00000001/savedata";
        remote = "/Sync/EmuSaves/RPCS3/saves";
      };

      rpcs3-trophy = {
        local = "${config.home.homeDirectory}/.config/rpcs3/dev_hdd0/home/00000001/trophy";
        remote = "/Sync/EmuSaves/RPCS3/trophy";
      };

      dolphin-gc = {
        local = "${config.home.homeDirectory}/.local/share/dolphin-emu/GC";
        remote = "/Sync/EmuSaves/Dolphin/GC";
      };

      dolphin-wii = {
        local = "${config.home.homeDirectory}/.local/share/dolphin-emu/Wii";
        remote = "/Sync/EmuSaves/Dolphin/Wii";
      };

      dolphin-states = {
        local = "${config.home.homeDirectory}/.local/share/dolphin-emu/StateSaves";
        remote = "/Sync/EmuSaves/Dolphin/StateSaves";
      };

      duckstation-saves = {
        local = "${config.home.homeDirectory}/.local/share/duckstation/savestates";
        remote = "/Sync/EmuSaves/Duckstation/savestates";
      };

      duckstation-memcards = {
        local = "${config.home.homeDirectory}/.local/share/duckstation/memcards";
        remote = "/Sync/EmuSaves/Duckstation/memcards";
      };

      azahar-nand = {
        local = "${config.home.homeDirectory}/.local/share/azahar-emu/nand";
        remote = "/Sync/EmuSaves/Azahar/nand";
      };

      azahar-sdmc = {
        local = "${config.home.homeDirectory}/.local/share/azahar-emu/sdmc";
        remote = "/Sync/EmuSaves/Azahar/sdmc";
      };

      terraria-players = {
        local = "${config.home.homeDirectory}/.local/share/Terraria/Players";
        remote = "/Sync/GameSaves/Terraria/Players";
      };

      terraria-worlds = {
        local = "${config.home.homeDirectory}/.local/share/Terraria/Worlds";
        remote = "/Sync/GameSaves/Terraria/Worlds";
      };

      tmodloader-modconfigs = {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/ModConfigs";
        remote = "/Sync/GameSaves/Terraria/tModLoader/ModConfigs";
      };

      tmodloader-mods = {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/Mods";
        remote = "/Sync/GameSaves/Terraria/tModLoader/Mods";
      };

      tmodloader-players = {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/Players";
        remote = "/Sync/GameSaves/Terraria/tModLoader/Players";
      };

      tmodloader-resourcepacks = {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/ResourcePacks";
        remote = "/Sync/GameSaves/Terraria/tModLoader/ResourcePacks";
      };

      tmodloader-worlds = {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/Worlds";
        remote = "/Sync/GameSaves/Terraria/tModLoader/Worlds";
      };
    };
  };
}
