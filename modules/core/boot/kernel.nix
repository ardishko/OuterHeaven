{
  pkgs,
  hostname,
  config,
  lib,
  ...
}:
{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 3;
    kernelParams = [
      "split_lock_detect=off"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    # kernelParams = [ ];
    extraModulePackages =
      with config.boot.kernelPackages;
      (lib.lists.optionals (hostname == "ShadowMoses") [
        xpadneo
        usbip
      ]);
    kernelPackages =
      if (hostname == "Tanker") then
        pkgs.linuxPackages_jovian
      else if (hostname == "jd" || hostname == "theseus") then
        pkgs.linuxPackages_hardened
      else
        pkgs.linuxPackages;
    supportedFilesystems = [
      "ntfs"
      "zfs"
    ];
    kernelModules = if (hostname != "jd" || hostname != "theseus") then [
      "udev"
      "xpadneo"
      "hid-nintendo"
    ] else [
      "i2c-dev"
      "i915"
    ];
  };
  hardware.uinput.enable = true;
}
