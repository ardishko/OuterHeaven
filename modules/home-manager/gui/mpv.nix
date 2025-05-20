{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    package = pkgs.mpv;
    scripts = with pkgs.mpvScripts; [
      mpris
      seekTo
      webtorrent-mpv-hook
      # mpv-webm
      blacklistExtensions
      sponsorblock
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
    config = {
      save-watch-history = true;
      watch-later-options = "start";
      save-position-on-quit = true;
      keen-open = true;
    };
  };
  home.packages = with pkgs; [ open-in-mpv ];
}
