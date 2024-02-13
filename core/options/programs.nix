{ inputs, pkgs, ... }:
{
  programs = {
    dconf.enable = true;
    noisetorch.enable = true;
    droidcam.enable = true;
    sway.enable = true;
  };
}
