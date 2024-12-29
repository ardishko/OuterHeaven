{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    gzdoom
  ];
  xdg = {
    desktopEntries = {
      "gzdoom" = lib.mkForce {
        name = "GZDoom";
        type = "Application";
        icon = "gzdoom";
        terminal = false;
        exec = "env SDL_VIDEODRIVER=wayland gzdoom --alsa=pipewire";
      };
    };
    configFile."gzdoom/gzdoom.ini".text = ''
      [general]
      drivers = alsa
      alsa = pipewire
    '';
  };
}
