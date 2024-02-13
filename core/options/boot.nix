{ pkgs, config, ... }:
{
  #boot.loader.grub = {
  #  enable = true;
  #  devices = ["nodev"];
  #  efiSupport = true;
  #  useOSProber = true;
  #  theme =
  #    pkgs.fetchFromGitHub {
  #      owner = "catppuccin";
  #      repo = "grub";
  #      rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
  #      sha256 = "/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
  #    }
  #    + "/src/catppuccin-frappe-grub-theme";
  #};
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
      };
    };
    consoleLogLevel = 1;
    kernelParams = ["split_lock_detect=off"];
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = [ "ntfs" ];
    kernelModules = [ "udev" ];
    initrd = {
      kernelModules = [ "amdgpu" ];
    };
  };
}
