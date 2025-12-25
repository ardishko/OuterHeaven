{ config, pkgs, ... }:
{
  imports = [ ./hm-module.nix ];

  services.nextcloud-sync = {
    enable = true;
    serverUrl = "https://nextcloud.ardishco.net";
    usernameFile = "${config.home.homeDirectory}/.config/Nextcloud/nextcloud-username";
    passwordFile = "${config.home.homeDirectory}/.config/Nextcloud/nextcloud-password";
    displayNameFile = "${config.home.homeDirectory}/.config/Nextcloud/nextcloud-displayNameFile";
    environment = {
      QT_QPA_PLATFORM = "offscreen";
    };

    folders = [
      {
        local = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/usr/save/";
        remote = "/Sync/EmuSaves/Cemu/saves";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/sys/title/";
        remote = "/Sync/EmuSaves/Cemu/sys-title";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Cemu/mlc01/usr/title/";
        remote = "/Sync/EmuSaves/Cemu/usr-title";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/eden/keys/";
        remote = "/Sync/EmuSaves/Eden/keys";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/eden/nand/system/save/";
        remote = "/Sync/EmuSaves/Eden/system-save";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/eden/nand/user/save/";
        remote = "/Sync/EmuSaves/Eden/user-save";
      }
      {
        local = "${config.home.homeDirectory}/.config/rpcs3/dev_hdd0/home/00000001/savedata/";
        remote = "/Sync/EmuSaves/RPCS3/saves";
      }
      {
        local = "${config.home.homeDirectory}/.config/rpcs3/dev_hdd0/home/00000001/trophy/";
        remote = "/Sync/EmuSaves/RPCS3/trophy";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/dolphin-emu/GC/";
        remote = "/Sync/EmuSaves/Dolphin/GC";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/dolphin-emu/Wii/";
        remote = "/Sync/EmuSaves/Dolphin/Wii";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/dolphin-emu/StateSaves/";
        remote = "/Sync/EmuSaves/Dolphin/StateSaves";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/duckstation/savestates/";
        remote = "/Sync/EmuSaves/Duckstation/savestates";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/duckstation/memcards/";
        remote = "/Sync/EmuSaves/Duckstation/memcards";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/duckstation/bios/";
        remote = "/Sync/EmuSaves/Duckstation/bios";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/azahar-emu/nand/";
        remote = "/Sync/EmuSaves/Azahar/nand";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/azahar-emu/sdmc/";
        remote = "/Sync/EmuSaves/Azahar/sdmc";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Terraria/Players/";
        remote = "/Sync/GameSaves/Terraria/Players";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Terraria/Worlds/";
        remote = "/Sync/GameSaves/Terraria/Worlds";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/ModConfigs/";
        remote = "/Sync/GameSaves/Terraria/tModLoader/ModConfigs";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/Mods/";
        remote = "/Sync/GameSaves/Terraria/tModLoader/Mods";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/Players/";
        remote = "/Sync/GameSaves/Terraria/tModLoader/Players";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/ResourcePacks/";
        remote = "/Sync/GameSaves/Terraria/tModLoader/ResourcePacks";
      }
      {
        local = "${config.home.homeDirectory}/.local/share/Terraria/tModLoader/Worlds/";
        remote = "/Sync/GameSaves/Terraria/tModLoader/Worlds";
      }
      {
        local = "${config.home.homeDirectory}/Documents/TSI/";
        remote = "/Documents/TSI";
      }
    ];
    autoRestart = true;
    restartOnSessionChange = true;
    startInBackground = true;
  };
}
