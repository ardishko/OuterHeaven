{
  inputs,
  ...
}:
{
  imports = [ inputs.pterodactyl.nixosModules.default ];

  services.pterodactyl.panel = {
    enable = true;
    enableNginx = false; # We use nginx reverse proxy instead

    app = {
      url = "https://hosting.ardishco.net";
      # Generate: echo "base64:$(openssl rand -base64 32)" | sudo tee /etc/cred/pterodactyl-app.key
      keyFile = "/etc/cred/pterodactyl-app.key";
    };

    database = {
      createLocally = true;
      name = "pterodactyl";
      user = "pterodactyl";
      # Generate: openssl rand -base64 32 | sudo tee /etc/cred/pterodactyl-db.pass && sudo chmod 600 /etc/cred/pterodactyl-db.pass
      passwordFile = "/etc/cred/pterodactyl-db.pass";
    };

    redis = {
      createLocally = true;
      name = "pterodactyl-panel";
      # Generate: openssl rand -base64 32 | sudo tee /etc/cred/pterodactyl-redis.pass && sudo chmod 600 /etc/cred/pterodactyl-redis.pass
      passwordFile = "/etc/cred/pterodactyl-redis.pass";
    };

    # Generate: openssl rand -base64 32 | sudo tee /etc/cred/pterodactyl-hashids.salt && sudo chmod 600 /etc/cred/pterodactyl-hashids.salt
    hashids.saltFile = "/etc/cred/pterodactyl-hashids.salt";

    trustedProxies = [ "127.0.0.1" ]; # Nginx proxy
  };

  services.pterodactyl.wings = {
    enable = true;
    openFirewall = true;

    # After rebuilding panel and creating a node via admin interface, get the UUID from panel
    uuid = "";
    remote = "https://hosting.ardishco.net";

    # After creating a node in the panel, generate a token and save:
    # echo "token-id-from-panel" | sudo tee /etc/cred/pterodactyl-wings-token-id && sudo chmod 600 /etc/cred/pterodactyl-wings-token-id
    tokenIdFile = "/etc/cred/pterodactyl-wings-token-id";

    # echo "token-from-panel" | sudo tee /etc/cred/pterodactyl-wings-token && sudo chmod 600 /etc/cred/pterodactyl-wings-token
    tokenFile = "/etc/cred/pterodactyl-wings-token";

    api.ssl.enable = false; # Wings communicates internally, so we don't need SSL
  };
}
