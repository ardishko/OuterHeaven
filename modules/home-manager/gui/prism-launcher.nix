{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ prismlauncher ];
  xdg.desktopEntries = {
    "org.prismlauncher.PrismLauncher" = lib.mkForce {
      name = "Prism Launcher";
      type = "Application";
      icon = "org.prismlauncher.PrismLauncher";
      terminal = false;
      exec = "mullvad-exclude prismlauncher %u";
    };
  };
}
