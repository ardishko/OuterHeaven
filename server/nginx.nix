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

    virtualHosts.default = {
      locations."/".return = "301 https://www.youtube.com/watch?v=dQw4w9WgXcQ";
      default = true;
    };
    virtualHosts."agrf.ardishco.net" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        return = "301 https://agracingfoundation.org/static/images/psp.gif";
      };
    };
    virtualHosts."jesus.ardishco.net" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        return = "301 https://agracingfoundation.org/static/images/psp.gif";
      };
    };
    virtualHosts."immich.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:2283";
      };
    };

    virtualHosts."vault.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8222";
      };
    };

    virtualHosts."stats.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3000";
      };
    };

    virtualHosts."media.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8096";
      };
    };

    virtualHosts."hosting.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9000";
      };
    };
  };
}
