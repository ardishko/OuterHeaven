{ pkgs, config, hostname, ... }:
{
  boot = {
    consoleLogLevel = 1;
    kernelParams = [ "split_lock_detect=off" ];
    /*     kernelParams = [ ]; */
    extraModulePackages = with pkgs; [ ] ++ (lib.lists.optionals (hostname == "ShadowMoses") [
      linuxKernel.packages.linux_xanmod.xpadneo
    ]);
    kernelPackages = if (hostname == "Tanker") then pkgs.linuxPackages_jovian else pkgs.linuxPackages_xanmod;
    supportedFilesystems = [ "ntfs" ];
    kernelModules = [ "udev" "xpadneo" "hid-nintendo" ];
  };
}
