{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud31;
    notify_push.enable = true;
    extraApps = {
      inherit (pkgs.nextcloud31Packages.apps)
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
        sha256 = "sha256-8U2EOK8mXPEk70IU8GLXYU0EoZU7O4fhFkzhGpauvZc=";
        url = "https://github.com/nextcloud/news/releases/download/26.1.0/news.tar.gz";
        appVersion = "26.1.0";
        license = "agpl3Plus";
      };
      epubviewer = pkgs.fetchNextcloudApp {
        appName = "epubviewer";
        sha256 = "sha256-3JsZY/aF0TbSdAEgS7q53DS9wMcxz4l3A8yyQtJBepM=";
        url = "https://github.com/devnoname120/epubviewer/releases/download/1.8.0/epubviewer-1.8.0.tar.gz";
        appVersion = "1.8.0";
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
        "192.168.1.106"
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
