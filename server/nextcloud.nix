{ pkgs, config, ... }:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud28;
    extraApps = {
      inherit (pkgs.nextcloud28Packages.apps) cookbook notes bookmarks maps tasks spreed previewgenerator phonetrack memories calendar contacts forms;
    news = pkgs.fetchNextcloudApp {
      appName = "news";
      sha256 = "sha256-aePXUn57U+1e01dntxFuzWZ8ILzwbnsAOs60Yz/6zUU=";
      url = "https://github.com/nextcloud/news/releases/download/25.0.0-alpha4/news.tar.gz";
      appVersion = "25.0.0-alpha4";
      license = "agpl3Plus";
      }; 
    epubviewer = pkgs.fetchNextcloudApp {
      appName = "epubviewer";
      sha256 = "sha256-ZRz/IadW6xm1Dd4+/GzMhxof11Sp7XEaloExDwgHzCY=";
      url = "https://github.com/devnoname120/epubviewer/releases/download/1.5.3/epubviewer-1.5.3.tar.gz";
      appVersion = "1.5.3";
      license = "agpl3Plus";
      }; 
    };
    hostName = "files.ardishco.net";
    config.adminpassFile = "/persist/etc/nextcloud-admin-pass";
    settings = {
      trusted_domains = [ 
        "files.ardishco.net"
        "192.168.1.112"
      ];
    };
  };
  # services.nginx.enable = true;
  # services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
  #   forceSSL = true;
  #   enableACME = true;
  # };
  # security.acme.certs.default.email = "config.security.acme.defaults.email";
  # security.acme.certs.default.listenHTTP = ":80";
  # security.acme.acceptTerms = true;
}
