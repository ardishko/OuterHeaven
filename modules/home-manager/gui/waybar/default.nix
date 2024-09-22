{
  # style.css
  programs.waybar.enable = true;
  xdg.configFile = {
    "waybar/style.css".source = ./style.css; 
    # config
    "waybar/config".source = ./config;
    # modules
    "waybar/modules".source = ./modules;
  };
}
