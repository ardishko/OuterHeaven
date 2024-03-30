{pkgs, ...}: {
  programs = {
    obs-studio = {
      enable = true;
      plugins = [
        pkgs.obs-studio-plugins.obs-vkcapture
        pkgs.obs-studio-plugins.input-overlay
        pkgs.obs-studio-plugins.droidcam-obs
        pkgs.obs-studio-plugins.obs-vaapi
        pkgs.obs-studio-plugins.obs-gstreamer
      ];
    };
  };
}
