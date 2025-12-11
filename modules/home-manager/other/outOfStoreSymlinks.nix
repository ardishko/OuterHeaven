{
  hostname,
  lib,
  config,
  ...
}:
{
  home.file = {
    "Games/Emulators" = lib.mkIf (hostname == "ShadowMoses") {
      source = config.lib.file.mkOutOfStoreSymlink "/disks/EEEEEEEEEEE/Totally Legit Consoles/Totally Legit Games";
    };

    "Games/EMULATORS.txt".text = ''
      Setup Instructions for New Devices
      ===================================

      1. Create the following console folders in your games directory:
         - 3DS
         - dolphin
         - N64
         - NES
         - Nintendo Switch
         - PS1
         - PS2
         - PS3
         - PSP
         - SNES
         - Wii U
         - Xbox360

         NOTE: Folder names are case-sensitive and must be exact!

      2. On ShadowMoses: ~/Games/Emulators symlinks to /disks/EEEEEEEEEEE/Totally Legit Consoles/Totally Legit Games

      3. On other hosts: Manually create symlink or access games directly from storage location (most likely suitable for every host except ShadowMoses lol)

      4. Configure Steam ROM Manager to scan these directories
    '';
  };
}
