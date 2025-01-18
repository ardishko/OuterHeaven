{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    extraApps = {
      inherit (pkgs.nextcloud29Packages.apps)
        cookbook
        notes
        bookmarks
        maps
        tasks
        spreed
        previewgenerator
        phonetrack
        memories
        calendar
        contacts
        forms
        ;
      news = pkgs.fetchNextcloudApp {
        appName = "news";
        sha256 = "sha256-9exftg1BS9pTJeKdJzt0XzXlFRDNZCh8aBgkC+e40zc=";
        url = "https://github.com/nextcloud/news/releases/download/25.0.0-alpha8/news.tar.gz";
        appVersion = "25.0.0-alpha8";
        license = "agpl3Plus";
      };
      epubviewer = pkgs.fetchNextcloudApp {
        appName = "epubviewer";
        sha256 = "sha256-S2qd3mc/KS7QboJTVJce14wy9/yEvtFUxCaK9RuPrlI=";
        url = "https://github.com/devnoname120/epubviewer/releases/download/1.5.3/epubviewer-1.5.3.tar.gz";
        appVersion = "1.5.3";
        license = "agpl3Plus";
      };
    };
    hostName = "nextcloud.ardishco.net";
    config = {
      adminpassFile = "/etc/cred/nextcloud-admin-pass";
      dbtype = "pgsql";
    };
    settings = {
      trusted_domains = [
        "nextcloud.ardishco.net"
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
