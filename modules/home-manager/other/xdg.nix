{ lib, ... }:
{
  xdg.mimeApps = {
    enable = true;
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
