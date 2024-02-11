{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    extraModulePackages = [];
    supportedFilesystems = ["ntfs"];
    kernelModules = ["kvm-intel" "udev"];
    initrd = {
      kernelModules = ["amdgpu"];
      availableKernelModules = ["vmd" "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod"];
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/12f4f756-dfdb-40fd-8ed7-cf710e8cff28";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/93FD-AE0A";
    fsType = "vfat";
  };
  fileSystems."/mnt/EEEEEEEEEEE" = {
    device = "/dev/disk/by-uuid/bd44ffbb-b994-4b47-b5a2-eea71704cfbf";
    fsType = "ext4";
  };
  fileSystems."/mnt/1TBCP" = {
    device = "/dev/disk/by-uuid/cee53a9e-310e-4ead-bde1-cb8ef6badc87";
    fsType = "ext4";
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
