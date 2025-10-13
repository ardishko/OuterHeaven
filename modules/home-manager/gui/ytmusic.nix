{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ytmdesktop
  ];
  # TODO Add Catppuccin Theme here...
}
