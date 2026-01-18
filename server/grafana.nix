{
  services = {
    grafana = {
      enable = true;
      openFirewall = true;
      settings.server = {
        http_addr = "0.0.0.0"; # listen on all interfaces
        http_port = 3000;
      };
      provision = {
        enable = true;
      };
    };
    loki.configuration = {
      auth_enabled = false;
      server.http_listen_port = 3100;

      ingester.lifecycler = {
        address = "127.0.0.1";
        ring.kvstore.store = "inmemory";
        ring.replication_factor = 1;
      };

      schema_config.configs = [
        {
          from = "2025-01-01"; # any date >= today
          store = "tsdb";
          object_store = "filesystem";
          schema = "v13";
          index = {
            prefix = "index_";
            period = "24h";
          };
        }
      ];

      storage_config = {
        tsdb_shipper.active_index_directory = "/var/lib/loki/tsdb-index";
        tsdb_shipper.cache_location = "/var/lib/loki/tsdb-cache";
        filesystem.directory = "/var/lib/loki/chunks";
      };

      limits_config = {
        ingestion_burst_size_mb = 16;
        ingestion_rate_mb = 8;
        # allow_structured_metadata defaults OK when using v13+tsdb
      };
    };
    # promtail = {
    #   enable = true;
    # };
    prometheus = {
      enable = true;
    };
  };
}
