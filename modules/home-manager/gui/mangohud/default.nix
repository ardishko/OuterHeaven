{ pkgs, ... }:
{ 
  home.packages = with pkgs; [ mangohud ];
  xdg.configFile."MangoHud/MangoHud.conf".source = ./MangoHud.conf; 
}
