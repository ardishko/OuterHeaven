{ pkgs, hostname, inputs, ... }:
{
  boot = {
    initrd.verbose = false;
    consoleLogLevel = 1;
    kernelParams = [ "split_lock_detect=off" "quiet" ];
    # kernelParams = [ ];
    extraModulePackages =
      with pkgs;
      (lib.lists.optionals (hostname == "ShadowMoses") [ ]);
    kernelPackages =
      if (hostname == "Tanker") then
        pkgs.linuxPackages_jovian
      else if (hostname == "jd") then
        pkgs.linuxPackages_hardened
      else
        inputs.chaotic.packages.${pkgs.system}.linuxPackages_cachyos;
    supportedFilesystems = [ "ntfs" ];
    kernelModules = [
      "udev"
      "xpadneo"
      "hid-nintendo"
    ];
    zfs.package = if (hostname == "Tanker") then pkgs.zfs else if (hostname == "jd") then pkgs.zfs else pkgs.zfs_unstable.overrideAttrs (prevAttrs: {
      inherit (inputs.chaotic.packages.${pkgs.system}.linuxPackages_cachyos-lto.zfs_cachyos) src;
      patches = [ ];
      passthru = prevAttrs.passthru // {
        kernelModuleAttribute = "zfs_cachyos";
      };
    });
  };
  hardware.uinput.enable = true;
}
