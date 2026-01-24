{ ... }:
{
  virtualisation.oci-containers = {
    containers = {
      "pufferpanel" = {
        image = "pufferpanel/pufferpanel:latest";
        ports = [
          "0.0.0.0:7777:7777"
          "25560-25570:25560-25570"
          "127.0.0.1:9000:8080"
        ];
        environment = {
          PUFFER_LOGS = "/etc/pufferpanel/logs";
          PUFFER_PANEL_DATABASE_DIALECT = "sqlite3";
          PUFFER_PANEL_DATABASE_URL = "file:/etc/pufferpanel/pufferpanel.db?cache=shared";
          PUFFER_DAEMON_DATA_CACHE = "/var/lib/pufferpanel/cache";
          PUFFER_DAEMON_DATA_SERVERS = "/var/lib/pufferpanel/servers";
          PUFFER_DAEMON_DATA_MODULES = "/var/lib/pufferpanel/modules";
        };
        volumes = [
          "/etc/pufferpanel:/etc/pufferpanel"
          "/var/lib/pufferpanel:/var/lib/pufferpanel"
        ];
        extraOptions = [ "--pull=newer" ];
      };
    };
  };
}
