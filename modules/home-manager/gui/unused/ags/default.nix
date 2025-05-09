{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];
  programs.ags = {
    enable = true;
    # package = ../../packages/pkgcustom/ags;
    # null or patch, leave as null if you don't want hm to manage the config
    # configDir = ./config;
    configDir = null;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
      bun
    ];
  };
}
