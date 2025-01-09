{ pkgs, hostname, config, lib, ... }:
{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 1;
    kernelParams = [ "split_lock_detect=off" "quiet" ];
    # kernelParams = [ ];
    extraModulePackages =
      with config.boot.kernelPackages;
      (lib.lists.optionals (hostname == "ShadowMoses") [ xpadneo usbip ]);
    kernelPackages =
      if (hostname == "Tanker") then
        pkgs.linuxPackages_jovian
      else if (hostname == "jd") then
        pkgs.linuxPackages_hardened
      else
        pkgs.linuxPackages;
    supportedFilesystems = [ "ntfs" "zfs" ];
    kernelModules = [
      "udev"
      "xpadneo"
      "hid-nintendo"
    ];
  };
  hardware.uinput.enable = true;
}
