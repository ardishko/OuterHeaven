{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];
  services.xserver.videoDrivers = [ "nvidia" ];

  boot = {
    extraModulePackages = [ ];
    supportedFilesystems = [ "ntfs" ];
    kernelModules = [
      "kvm-intel"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    initrd = {
      availableKernelModules = [
        "vmd"
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
      kernelModules = [ "nvidia" ];
    };
    kernelParams = [
      # "mem_sleep_default=deep"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
      "nvidia.NVreg_TemporaryFilePath=/run/nvidia-persistenced"
      "nvidia.NVreg_DynamicPowerManagement=0x00"
    ];
  };

  hardware = {
    nvidia = {
      # enabled = true;
      videoAcceleration = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;
      powerManagement.enable = true;
      nvidiaPersistenced = true;
    };
  };
  environment.sessionVariables = {
    # __GL_SYNC_TO_VBLANK = "0";
    # __GL_YIELD = "run"; # yields to the compositor instead of busy‑waiting
    __NV_DISABLE_EXPLICIT_SYNC = "1";
  };
  
  #fileSystems."/" = {
  #  device = "/dev/disk/by-uuid/12f4f756-dfdb-40fd-8ed7-cf710e8cff28";
  #  fsType = "ext4";
  #};
  #fileSystems."/boot" = {
  #  device = "/dev/disk/by-uuid/93FD-AE0A";
  #  fsType = "vfat";
  #};

  # External drives

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
