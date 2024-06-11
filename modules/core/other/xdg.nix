{ inputs, pkgs, lib, ... }:
{

# It looks lonely here... Maybe one day I'll put something here.
# Someday.
  xdg.portal = {
    enable = true;
    wlr = lib.mkForce {
      enable = false;
    };
  };
}
