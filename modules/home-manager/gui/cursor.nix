{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.frappeDark;
    name = "catppuccin-frappe-dark-cursors";
    size = 24;
    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
