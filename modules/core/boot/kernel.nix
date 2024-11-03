{ pkgs, hostname, inputs, ... }:
{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 1;
    kernelParams = [ "split_lock_detect=off" "quiet" ];
    # kernelParams = [ ];
    extraModulePackages =
      with pkgs;
      (lib.lists.optionals (hostname == "ShadowMoses") [ inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.linuxKernel.packages.linux_lqx.xpadneo inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.linuxKernel.packages.linux_lqx.usbip ]);
    kernelPackages =
      if (hostname == "Tanker") then
        pkgs.linuxPackages_jovian
      else if (hostname == "jd") then
        pkgs.linuxPackages_hardened
      else
        inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.linuxKernel.packages.linux_lqx;
    supportedFilesystems = [ "ntfs" "zfs" ];
    kernelModules = [
      "udev"
      "xpadneo"
      "hid-nintendo"
    ];
  };
  hardware.uinput.enable = true;
}
