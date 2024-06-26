{ inputs, pkgs, lib, hostname, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;

  # null or patch, leave as null if you don't want hm to manage the config
    # configDir = ./config;
    configDir = null;
    extraPackages = with pkgs ; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };
}
