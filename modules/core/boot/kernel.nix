{ pkgs, config, ... }:
{
  boot = {
    consoleLogLevel = 1;
    kernelParams = ["split_lock_detect=off"]; 
/*     kernelParams = [ ]; */
    extraModulePackages = with pkgs; [ linuxKernel.packages.linux_xanmod.xpadneo ];
    kernelPackages = pkgs.linuxPackages_xanmod;
    supportedFilesystems = [ "ntfs" ];
    kernelModules = [ "udev" "xpadneo" "hid-nintendo" ];
  };
}
