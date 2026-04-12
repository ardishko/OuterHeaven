{
  config,
  ...
}:

{
  services.pterodactyl.panel = {
    enable = true;
    enableNginx = false;
    user = "nginx";
    group = "nginx";

    app = {
      url = "https://hosting.ardishco.net";
      keyFile = "/etc/cred/pterodactyl-app-key";
    };

    database = {
      createLocally = true;
      user = "pterodactyl-panel";
      passwordFile = "/etc/cred/pterodactyl-db-password";
    };

    redis = {
      createLocally = true;
      passwordFile = "/etc/cred/pterodactyl-redis-password";
    };

    hashids.saltFile = "/etc/cred/pterodactyl-hashids-salt";

    mail = {
      mailer = "smtp";
      host = "127.0.0.1";
      fromAddress = "panel@ardishco.net";
    };

    telemetry.enable = false;
  };

  services.phpfpm.pools.pterodactyl-panel = {
    user = "nginx";
    group = "nginx";
    phpPackage = config.services.pterodactyl.panel.phpPackage;
    settings = {
      "listen.owner" = config.services.nginx.user;
      "listen.group" = config.services.nginx.group;
      "pm" = "dynamic";
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
    };
  };

  services.pterodactyl.wings = {
    enable = true;
    openFirewall = false;

    remote = "https://hosting.ardishco.net";
    uuid = "paste-node-uuid-from-panel-here";
    tokenIdFile = "/etc/cred/pterodactyl-wings-token-id";
    tokenFile = "/etc/cred/pterodactyl-wings-token";

    api.ssl = {
      enable = true;
      certFile = config.security.acme.certs."hosting.ardishco.net".directory + "/cert.pem";
      keyFile = config.security.acme.certs."hosting.ardishco.net".directory + "/key.pem";
    };
  };
  users.users.pterodactyl-wings.extraGroups = [ "acme" ];
}
