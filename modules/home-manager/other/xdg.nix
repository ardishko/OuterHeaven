{
  lib,
  pkgs,
  ...
}:
let
  steamDeckScript = pkgs.writeShellScript "steam-deck-launcher" ''
    #!/usr/bin/env bash
    read -r W H <<< $("${pkgs.kdePackages.kscreen}/bin/kscreen-doctor" -o | grep "Mode" | head -n1 | "${pkgs.gawk}/bin/awk" '{print $2}' | tr x ' ')
    "${pkgs.mullvad}/bin/mullvad-exclude" "${pkgs.gamescope}/bin/gamescope" --expose-wayland -f -W "$W" -H "$H" -- "${pkgs.steam}/bin/steam" -gamepadui "$@"
  '';
in
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
          ${steamDeckScript}
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
