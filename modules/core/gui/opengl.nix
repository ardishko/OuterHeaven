{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        # rocmPackages_5.clr.icd
        # rocmPackages_5.clr
        # rocmPackages_5.rocminfo
        # rocmPackages_5.rocm-runtime
      ];
    };
    amdgpu = {
      opencl = {
        enable = true;
      };
      initrd = {
        enable = true;
      };
    };
  };
}
