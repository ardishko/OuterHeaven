{ pkgs, lib, ... }:
{
  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = false;
    notoPackage = pkgs.nerd-fonts.iosevka;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    qttools # Expose qdbus in PATH
    ark
    elisa
    gwenview
    okular
    kate
    khelpcenter
    dolphin
    baloo-widgets # baloo information in Dolphin
    dolphin-plugins
    spectacle
    ffmpegthumbs
    xwaylandvideobridge
    discover
    kwallet
    kwallet-pam
    kwalletmanager
    kde-gtk-config
    plasma-integration
    libplasma
    frameworkintegration
    kauth
    phonon-vlc
    kdeplasma-addons
    plasma-systemmonitor
  ];
  security.pam.services = {
    login = {
      kwallet = {
        enable = lib.mkForce true;
      };
    };
    sddm = {
      kwallet = {
        enable = true;
      };
    };
    kde = {
      allowNullPassword = true;
      kwallet = {
        enable = lib.mkForce true;
      };
    };
  };
  systemd.user.services.nextcloud-client.after = [ "graphical-session.target" ];
  systemd.user.services.nextcloud-client.wants = [ "graphical-session.target" ];
}
