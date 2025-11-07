{ hostname, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; if (hostname == "theseus") then [
        intel-media-driver # for newer Intel GPUs (N100, Alder Lake, etc.)
        intel-vaapi-driver # older fallback
        libvdpau-va-gl # optional, for broader support
      ] else [ ];
    };
    amdgpu = {
      opencl = {
        enable = if (hostname == "Kamurocho") then false else true;
      };
      initrd = {
        enable = if (hostname == "Kamurocho") then false else true;
      };
    };
  };
}
