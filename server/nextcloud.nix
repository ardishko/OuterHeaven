{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud32;
    database.createLocally = true;
    https = true;
    maxUploadSize = "1000G";
    # notify_push.enable = true;
    extraApps = {
      inherit (pkgs.nextcloud32Packages.apps)
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
        sha256 = "18c05gldhm3z4si2acdh433j37mjxkcg6dajlkx9qh3bnxyja7kr";
        url = "https://github.com/nextcloud/news/releases/download/27.2.0/news.tar.gz";
        appVersion = "27.2.0";
        license = "agpl3Plus";
      };
      epubviewer = pkgs.fetchNextcloudApp {
        appName = "epubviewer";
        sha256 = "0wjkbp50sir66lcxv6amnbq06ngcl0gj55azpbq2gg6ds2x041nh";
        url = "https://github.com/devnoname120/epubviewer/releases/download/1.8.1/epubviewer-1.8.1.tar.gz";
        appVersion = "1.8.1";
        license = "agpl3Plus";
      };
    };
    hostName = "nextcloud.ardishco.net";
    config = {
      adminuser = "king";
      adminpassFile = "/etc/cred/nextcloud-admin-pass";
      dbtype = "pgsql";
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
    };
    settings = {
      trusted_domains = [
        "nextcloud.ardishco.net"
        "old-nextcloud.ardishco.net"
        "192.168.1.152"
        "127.0.0.1"
        "::1"
      ];
    };
  };
}
