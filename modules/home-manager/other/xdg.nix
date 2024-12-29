{ lib, ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/magnet" = [ "mpv.desktop" ];
      "x-scheme-handler/curseforge" = [ "prismlauncher.desktop" ];
      "application/x-doom" = [ "gzdoom.desktop" ];
    };
  };
  xdg.desktopEntries = {
    "steam" = lib.mkForce {
      name = "Steam (mullvad-exclude)";
      type = "Application";
      icon = "steam";
      terminal = false;
      exec = "mullvad-exclude steam %u";
    };
  };
}
