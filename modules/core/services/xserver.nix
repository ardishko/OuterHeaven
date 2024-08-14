{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      layout = "tr";
      xkbVariant = "";
      excludePackages = [ pkgs.xterm ];
    };
  };
}
