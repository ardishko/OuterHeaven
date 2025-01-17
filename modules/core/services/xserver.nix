{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      xkb = {
        variant = "";
        layout = "tr";
      };
      excludePackages = [ pkgs.xterm ];
      displayManager.lightdm.enable = false;
    };
  };
}
