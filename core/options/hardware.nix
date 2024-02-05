{ pkgs, ... }:
{
  hardware = {
    # Enable OpenGL and Vulkan stuff
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
    };
    bluetooth.enable = true;
  };
}
