{
  config,
  inputs,
  ...
}:

{
  # SECRETS - create before first deploy, restart pterodactyl-panel-setup.service after
  # echo "base64:$(openssl rand -base64 32)" | sudo tee /etc/cred/pterodactyl-app-key
  # openssl rand -base64 24 | sudo tee /etc/cred/pterodactyl-hashids-salt
  # openssl rand -base64 24 | sudo tee /etc/cred/pterodactyl-redis-password
  # sudo chmod 640 /etc/cred/pterodactyl-*
  # sudo chown root:nginx /etc/cred/pterodactyl-*
  #
  # After creating node in panel UI:
  # echo -n "<token-id>" | sudo tee /etc/cred/pterodactyl-wings-token-id
  # echo -n "<token>" | sudo tee /etc/cred/pterodactyl-wings-token
  # sudo chmod 640 /etc/cred/pterodactyl-wings-token*
  # sudo chown root:pterodactyl-wings /etc/cred/pterodactyl-wings-token*

  imports = [ inputs.pterodactyl-nix.nixosModules.default ];
  nixpkgs.overlays = [ inputs.pterodactyl-nix.overlays.default ];

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
      user = "nginx";
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
    openFirewall = true;

    remote = "https://hosting.ardishco.net";
    uuid = "7a247f75-cc1c-46f5-9866-20618386172f";
    tokenIdFile = "/etc/cred/pterodactyl-wings-token-id";
    tokenFile = "/etc/cred/pterodactyl-wings-token";

    api.ssl = {
      enable = true;
      certFile = config.security.acme.certs."hosting.ardishco.net".directory + "/cert.pem";
      keyFile = config.security.acme.certs."hosting.ardishco.net".directory + "/key.pem";
    };
  };
  users.users.pterodactyl-wings.extraGroups = [
    "acme"
    "nginx"
  ];
}
