{ pkgs, config, ... }:
{
  boot = {
    consoleLogLevel = 1;
    kernelParams = ["split_lock_detect=off"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = [ "ntfs" ];
    kernelModules = [ "udev" ];
  };
}
