{ pkgs, lib, ... }: {
  programs = {
    obs-studio = {
      enable = true;
      plugins = [
        pkgs.obs-studio-plugins.obs-vkcapture
        pkgs.obs-studio-plugins.input-overlay
        pkgs.obs-studio-plugins.droidcam-obs
        pkgs.obs-studio-plugins.obs-vaapi
        pkgs.obs-studio-plugins.obs-gstreamer
        pkgs.obs-studio-plugins.obs-webkitgtk
        pkgs.obs-studio-plugins.obs-tuna
        pkgs.obs-studio-plugins.obs-replay-source
        pkgs.obs-studio-plugins.obs-pipewire-audio-capture
        pkgs.obs-studio-plugins.wlrobs
      ];
    };
  };
  xdg.desktopEntries = {
    "com.obsproject.Studio" = lib.mkForce {
      name = "OBS Studio";
      type = "Application";
      icon = "com.obsproject.Studio";
      terminal = false;
      exec = "mullvad-exclude obs --startreplaybuffer";
    };
  };
}
