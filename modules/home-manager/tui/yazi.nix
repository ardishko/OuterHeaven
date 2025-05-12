{ lib, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  xdg.desktopEntries = {
    yazi = lib.mkForce {
      name = "yazi";
      type = "Application";
      mimeType = [ "text/plain" ];
      icon = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/sxyazi/yazi/main/assets/logo.png";
        sha256 = "05crmd367v5915i553z172fsip6y8n8mvppjcpqxq9v7bml1vw3x";
      };
      exec = "${pkgs.wezterm}/bin/wezterm ${pkgs.yazi}/bin/yazi";
    };
  };
}
