{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [ wlogout ];
  xdg.configFile."wlogout/layout".source = ./layout;
}
