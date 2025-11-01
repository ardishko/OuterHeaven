{
  services = {
    grafana = {
      enable = true;
      openFirewall = true;
      settings.server = {
        http_addr = "0.0.0.0";   # listen on all interfaces
        http_port = 3000;
      };
      provision = {
        enable = true;
      };
    };
    loki = {
      enable = true;
    };
    promtail = {
      enable = true;
    };
    prometheus = {
      enable = true;
    };
  };
}
