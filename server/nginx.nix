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
  };

  # nginx TLS vhosts
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # <-- add this block
    commonHttpConfig = ''
      # cloudflared runs locally and forwards CF-Connecting-IP
      real_ip_header CF-Connecting-IP;
      set_real_ip_from 127.0.0.1;
    '';

    virtualHosts."nextcloud.ardishco.net" = {
      forceSSL = true;
      enableACME = true;
      listen = [
        {
          addr = "127.0.0.1";
          port = 443;
          ssl = true;
        }
      ];
      locations."/" = {
        proxyPass = "http://127.0.0.1:80";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-Proto https;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        '';
      };
    };

    virtualHosts."immich.ardishco.net" = {
      forceSSL = true;
      enableACME = true;
      listen = [
        {
          addr = "127.0.0.1";
          port = 443;
          ssl = true;
        }
      ];
      locations."/" = {
        proxyPass = "http://127.0.0.1:2283";
      };
    };

    virtualHosts."vault.ardishco.net" = {
      forceSSL = true;
      enableACME = true;
      listen = [
        {
          addr = "127.0.0.1";
          port = 443;
          ssl = true;
        }
      ];
      locations."/" = {
        proxyPass = "http://127.0.0.1:8222";
      };
    };
  };
}
