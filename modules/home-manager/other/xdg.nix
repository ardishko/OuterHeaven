{
  lib,
  pkgs,
  ...
}:
{
  xdg = {
    desktopEntries = {
      "steam" = lib.mkForce {
        name = "Steam";
        type = "Application";
        icon = "steam";
        terminal = false;
        exec = "mullvad-exclude steam %u";
        mimeType = [ "x-scheme-handler/steam" ];
      };
      "steam-deck" = {
        name = "Steam (Deck Mode)";
        type = "Application";
        icon = "steam";
        exec = ''
          env SCB_STEAMARGIGNORE=0 SCB_AUTO_RES=1 SCB_AUTO_REFRESH=1 scopebuddy --expose-wayland --force-grab-cursor -s 1.7 -f --steam -- mullvad-exclude steam -steamos -gamepadui
        '';
        terminal = false;
        categories = [ "Game" ];
      };
    };
    configFile = {
      "user-dirs.dirs" = {
        text = ''
          XDG_DESKTOP_DIR="$HOME/Desktop"
          XDG_DOWNLOAD_DIR="$HOME/Downloads"
          XDG_TEMPLATES_DIR="$HOME/Templates"
          XDG_PUBLICSHARE_DIR="$HOME/Public"
          XDG_DOCUMENTS_DIR="$HOME/Documents"
          XDG_MUSIC_DIR="$HOME/Music"
          XDG_PICTURES_DIR="$HOME/Pictures"
          XDG_VIDEOS_DIR="$HOME/Videos"
        '';
        force = true;
      };
      "user-dirs.locale" = {
        text = "en_US\n";
        force = true;
      };
    };
  };
}
