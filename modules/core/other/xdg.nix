{ lib, pkgs, ... }:
{
  # It looks lonely here... Maybe one day I'll put something here.
  # Someday.
  xdg.portal = {
    enable = true;
    wlr = lib.mkForce { enable = false; };
    extraPortals = with pkgs; [
      kdePackages.kwallet
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
}
