{ pkgs, ...}:
{
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.libsForQt5.qt5ct;
    };
  };
  imports = [
    ./qt5ct.nix
  ];
}
