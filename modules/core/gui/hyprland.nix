{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true; # enabling this for hyprland to have a desktop entry for it to appear on my display manager (sddm)
    # portalPackage = inputs.xdg-desktop-portal-hyprland.packages.${pkgs.system}.default;
    package = pkgs.hyprland;
    withUWSM = true; # somehow makes it so that the desktop entry for Hyprland aren't duplicated
  };
}
