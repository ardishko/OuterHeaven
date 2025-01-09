{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    # portalPackage = inputs.xdg-desktop-portal-hyprland.packages.${pkgs.system}.default;
    package = pkgs.hyprland;
  };
}
