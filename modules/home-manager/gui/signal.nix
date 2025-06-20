{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ signal-desktop ];
  xdg.desktopEntries = {
    "signal" = lib.mkForce {
      name = "Signal";
      type = "Application";
      icon = "signal-desktop";
      terminal = false;
      exec = "mullvad-exclude signal-desktop --password-store=basic_text --no-sandbox %U";
    };
  };
}
