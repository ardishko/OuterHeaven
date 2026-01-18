{
  services.pufferpanel = {
    enable = true;
    environment = {
      PUFFER_WEB_HOST = "0.0.0.0:9000"; # Changed from :9000
      PUFFER_DAEMON_SFTP_HOST = ":5657";
      PUFFER_DAEMON_CONSOLE_BUFFER = "1000";
      PUFFER_DAEMON_CONSOLE_FORWARD = "true";
      PUFFER_PANEL_REGISTRATIONENABLED = "false";
    };
  };
}
