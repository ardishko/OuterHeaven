# modules/home-manager/gui/qs-hyprview.nix
{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    quickshell
    qt6.qtwayland
    qt6.qt5compat
  ];

  xdg.configFile."quickshell/qs-hyprview" = {
    source = inputs.qs-hyprview;
    recursive = true;
  };
}
