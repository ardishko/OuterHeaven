{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [ catppuccin-kvantum ];

  xdg.configFile."Kvantum/catppuccin-frappe-blue" = {
    source = "${pkgs.catppuccin-kvantum}/share/Kvantum/catppuccin-frappe-blue";
    recursive = true;
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=catppuccin-frappe-blue
  '';
}
