{
  services.home-assistant = {
    enable = true;
    config = {
      http = {
        server_port = 8123;
        trusted_proxies = [
          "127.0.0.1"
          "::1"
        ];
        use_x_forwarded_for = true;
      };
      homeassistant = {
        temperature_unit = "C";
        unit_system = "metric";
      };
    };
    configDir = "/var/lib/hass";
    configWritable = false;
  };
}
