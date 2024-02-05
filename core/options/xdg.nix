{ inputs, pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [inputs.xdg-desktop-portal-hyprland.packages.${pkgs.system}.default];
  };
}
