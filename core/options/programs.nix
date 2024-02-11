{ inputs, pkgs, ... }:
{
  programs = {
    dconf.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      gamescopeSession.enable = true;
    };
    noisetorch.enable = true;
    droidcam.enable = true;
    sway.enable = true;
  };
}
