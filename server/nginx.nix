{
  security.acme = {
    acceptTerms = true;
    defaults.email = "ardishco@protonmail.com";
    certs."nextcloud.ardishco.net" = {
      dnsProvider = "cloudflare";
      credentialsFile = "/etc/cred/cloudflare-dns.ini"; # CF_API_TOKEN=...
    };
    certs."immich.ardishco.net" = {
      dnsProvider = "cloudflare";
      credentialsFile = "/etc/cred/cloudflare-dns.ini";
    };
    certs."vault.ardishco.net" = {
      dnsProvider = "cloudflare";
      credentialsFile = "/etc/cred/cloudflare-dns.ini";
    };
    certs."pufferpanel.ardishco.net" = {
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

    virtualHosts."immich.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      host = "0.0.0.0";
      locations."/" = {
        proxyPass = "http://127.0.0.1:2283";
        # extraConfig = ''
        #   proxy_set_header Host $host;
        #   proxy_set_header X-Forwarded-Proto https;
        #   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        # '';
      };
    };

    virtualHosts."vault.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8222";
        # extraConfig = ''
        #   proxy_set_header Host $host;
        #   proxy_set_header X-Forwarded-Proto https;
        #   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        # '';
      };
    };

    virtualHosts."hosting.ardishco.net" = {
      addSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:9000";
        # extraConfig = ''
        #   proxy_set_header Host $host;
        #   proxy_set_header X-Forwarded-Proto https;
        #   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        # '';
      };
    };
  };
}
