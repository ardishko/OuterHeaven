{
  services.home-assistant = {
    enable = true;
    openFirewall = true;
    config = {
      http.server_port = 8123;
      homeassistant = {
        temperature_unit = "C";
        unit_system = "metric";
      };
    };
    configDir = "/var/lib/hass";
    configWritable = false;
  };
}
