{ pkgs, ... }:
{
  home.packages = with pkgs; [ qt6Packages.qt6ct ];
  xdg.configFile."qt6ct/qt6ct.conf".source = ./qt6ct.conf; 
}
