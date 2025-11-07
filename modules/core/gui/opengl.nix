{ hostname, pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = if (hostname == "jd") then false else true;
      enable32Bit = if (hostname == "jd") then false else true;
      extraPackages = with pkgs; if (hostname == "theseus") then [
        intel-media-driver # for newer Intel GPUs (N100, Alder Lake, etc.)
        intel-vaapi-driver # older fallback
        libvdpau-va-gl # optional, for broader support
      ] else [ ];
    };
    amdgpu = {
      opencl = {
        enable = if (hostname == "Kamurocho" || hostname == "jd" || hostname == "theseus") then false else true;
      };
      initrd = {
        enable = if (hostname == "Kamurocho" || hostname == "jd" || hostname == "theseus") then false else true;
      };
    };
  };
}
