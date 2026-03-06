{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud33;
    database.createLocally = true;
    https = true;
    maxUploadSize = "1000G";
    # notify_push.enable = true;
    extraApps = {
      inherit (pkgs.nextcloud33Packages.apps)
        cookbook
        notes
        bookmarks
        tasks
        spreed
        previewgenerator
        phonetrack
        calendar
        contacts
        forms
        ;
      news = pkgs.fetchNextcloudApp {
        appName = "news";
        sha256 = "sha256-jYtcsIiUvRv/AuMJJLTnGMdWlyYuQp8D3XJXjqZuaQw=";
        url = "https://github.com/nextcloud/news/releases/download/28.0.0/news.tar.gz";
        appVersion = "28.0.0";
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
        "192.168.1.152"
      ];
    };
  };
}
