{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ (callPackage ../packages/pkgcustom/pdiary { }) ];
  xdg.desktopEntries = {
    pdiary = lib.mkForce {
      name = "pdiary";
      type = "Application";
      mimeType = [ "text/plain" ];
      icon = "almanah";
      exec = "${pkgs.wezterm}/bin/wezterm pdiary";
    };
  };
}
