{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme = {
      name = "qt5ct";
    };
    style = {
      package = pkgs.libsForQt5.qt5ct;
    };
  };
  imports = [
    ./qt5ct.nix
    ./qt6ct.nix
  ];
}
