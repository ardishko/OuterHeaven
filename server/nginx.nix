{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = "ardishco@protonmail.com";
      dnsProvider = "cloudflare";
      credentialsFile = "/etc/cred/cloudflare-dns.ini";
    };
  };

  # nginx TLS vhosts
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedUwsgiSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;

    commonHttpConfig = ''
      limit_req_zone $binary_remote_addr zone=general:10m rate=10r/s;
    '';

    # Redirects
    virtualHosts.default = {
      locations."/".return = "301 https://www.youtube.com/watch?v=dQw4w9WgXcQ";
      default = true;
    };
    virtualHosts."agrf.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/".return = "301 https://agracingfoundation.org/static/images/psp.gif";
    };
    virtualHosts."jesus.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/".return = "301 https://agracingfoundation.org/static/images/psp.gif";
    };

    # Behind Anubis (browser-only services)
    virtualHosts."stats.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://unix:/run/anubis/anubis-stats/main.sock";
    };
    virtualHosts."gitlab.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://unix:/run/anubis/anubis-gitlab/main.sock";
        proxyWebsockets = true;
      };
    };
    virtualHosts."hosting.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://unix:/run/anubis/anubis-hosting/main.sock";
    };
    virtualHosts."reading.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://unix:/run/anubis/anubis-reading/main.sock";
    };

    # Rate-limited (services with native apps/APIs)
    virtualHosts."immich.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:2283";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
    virtualHosts."vault.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8222";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
    virtualHosts."media.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8096";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
    virtualHosts."home.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8123";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          limit_req zone=general burst=20 nodelay;
        '';
      };
    };
    virtualHosts."music.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:4533";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
    virtualHosts."audiobooks.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:13378";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
    virtualHosts."pages.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8090";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
    virtualHosts."uptime.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3001";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
    virtualHosts."netdata.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:19999";
        extraConfig = "limit_req zone=general burst=20 nodelay;";
      };
    };
  };
}
