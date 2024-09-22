{ pkgs, ... }:
{
  home.packages = with pkgs; [ heroic ];
  xdg.configFile."heroic/themes/catppuccin-frappe.css".source = ./catppuccin-frappe.css;
}
