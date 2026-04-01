{ ... }:
{
  networking = {
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    # resolvconf.enable = pkgs.lib.mkForce false;
    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "none";
  };
  services.resolved.enable = false;
  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;
      listen_addresses = [
        "127.0.0.1:53"
        "[::1]:53"
      ];
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
      forwarding_rules = "/etc/dnscrypt-proxy/forwarding-rules.txt";
      server_names = [ "adguard-dns-doh" ];
    };
  };
  environment.etc."dnscrypt-proxy/forwarding-rules.txt".text = ''
    ea.com                 9.9.9.9
    *.ea.com               9.9.9.9
    eaconnect.ea.com       9.9.9.9
    accounts.ea.com        9.9.9.9
    origin.com             9.9.9.9
    *.origin.com           9.9.9.9
  '';
}
