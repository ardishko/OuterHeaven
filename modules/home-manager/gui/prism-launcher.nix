{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ (prismlauncher.override { withWaylandGLFW = true; }) ];
  xdg.desktopEntries = {
    "org.prismlauncher.PrismLauncher" = lib.mkForce {
      name = "Turizm Launcher";
      type = "Application";
      icon = "org.prismlauncher.PrismLauncher";
      terminal = false;
      exec = "mullvad-exclude prismlauncher %u";
    };
  };
}
