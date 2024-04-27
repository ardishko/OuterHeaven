{ pkgs, config, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris
      seekTo
      webtorrent-mpv-hook
      mpv-webm
      blacklistExtensions
      sponsorblock
      simple-mpv-webui
      quality-menu
      cutter
      convert
      quality-menu
      mpv-playlistmanager
      chapterskip
    ];
    scriptOpts = {
      webtorrent = {
        path = "/tmp";
      };
    };
  };
  xdg.mimeApps = {
    defaultApplications = {
      "x-scheme-handler/magnet" = [ "mpv.desktop" ];
    };
  };  
  home.packages = with pkgs; [ open-in-mpv ];
}
