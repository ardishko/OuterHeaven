{
  services.gatus = {
    enable = true;
    settings = {
      web = {
        address = "127.0.0.1"; # nginx proxies it; don't expose directly
        port = 8095; # 8080 avoided in case Wings uses it
      };
      ui.title = "Some statusses";
      endpoints = [
        {
          name = "immich";
          group = "apps";
          url = "https://immich.ardishco.net/";
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "vaultwarden";
          group = "apps";
          url = "https://vault.ardishco.net/alive"; # Vaultwarden unauth liveness
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "jellyfin";
          group = "apps";
          url = "https://media.ardishco.net/health"; # returns "Healthy"
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "home-assistant";
          group = "apps";
          url = "https://home.ardishco.net/";
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "navidrome";
          group = "apps";
          url = "https://music.ardishco.net/ping"; # returns {"status":"ok"}
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "audiobookshelf";
          group = "apps";
          url = "https://audiobooks.ardishco.net/ping"; # returns {"success":true}
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "pterodactyl";
          group = "apps";
          url = "https://hosting.ardishco.net/";
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "mealie";
          group = "apps";
          url = "https://cooking.ardishco.net/api/app/about"; # unauth JSON
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }
        {
          name = "vikunja";
          group = "apps";
          url = "https://todo.ardishco.net/api/v1/info"; # unauth JSON
          interval = "60s";
          conditions = [
            "[STATUS] == 200"
            "[RESPONSE_TIME] < 1500"
            "[CERTIFICATE_EXPIRATION] > 168h"
          ];
        }

        # Behind Anubis: Checks the origin directly
        {
          name = "stats";
          group = "anubis";
          url = "http://127.0.0.1:3000/";
          interval = "60s";
          conditions = [
            "[STATUS] < 400"
            "[RESPONSE_TIME] < 800"
          ];
        }
        {
          name = "reading";
          group = "anubis";
          url = "http://127.0.0.1:5000/";
          interval = "60s";
          conditions = [
            "[STATUS] < 400"
            "[RESPONSE_TIME] < 800"
          ];
        }
      ];
    };
  };
}
