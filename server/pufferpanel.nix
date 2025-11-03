{
  services = {
    pufferpanel = {
      enable = true;
      extraGroups = [
        "gameHosting"
      ];
      environment = {
        PUFFER_WEB_HOST = ":9000";
        PUFFER_DAEMON_SFTP_HOST = ":5657";
        PUFFER_DAEMON_CONSOLE_BUFFER = "1000";
        PUFFER_DAEMON_CONSOLE_FORWARD = "true";
        PUFFER_PANEL_REGISTRATIONENABLED = "false";
      };
    };
  };
  users.groups.pufferpanel = {};                 # ensure group exists
  users.users.pufferpanel = {
    isSystemUser = true;
    group = "pufferpanel";
    home = "/var/lib/pufferpanel";
  };
}
