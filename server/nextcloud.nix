{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud31;
    database.createLocally = true;
    https = true;
    phpPackage = pkgs.php83.withExtensions (
      exts: with exts; [
        apcu
        redis
        opcache
      ]
    );
    # notify_push.enable = true;
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
      dbhost = "/run/postgresql";
      dbname = "nextcloud";
      dbuser = "nextcloud";
    };
    settings = {
      trusted_domains = [
        "nextcloud.ardishco.net"
        "192.168.1.106"
        "192.168.1.15"
      ];
      "memcache.local" = "\\OC\\Memcache\\APCu";
      "memcache.distributed" = "\\OC\\Memcache\\Redis";
      redis = {
        host = "/run/redis/redis.sock"; # using the socket
        port = 0; # 0 means "use socket"
      };
    };
  };
  services.redis = {
    enable = true;
    # use a local socket (faster, no TCP)
    unixSocket = "/run/redis/redis.sock";
    unixSocketPerm = 770; # group can read/write
  };
  # Nextcloud service user needs to read that socket
  users.users.nextcloud.extraGroups = [ "redis" ]; # the redis service creates group "redis"

}
