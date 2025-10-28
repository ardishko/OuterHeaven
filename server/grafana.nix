{ config, pkgs, ... }:
{
  ######## Metrics (Prometheus) ########
  services.prometheus = {
    enable = true;
    port = 9090;                      # UI/API
    # Scrape Prometheus itself + node exporter
    scrapConfigs = [
      {
        job_name = "prometheus";
        static_configs = [{ targets = [ "127.0.0.1:9090" ]; }];
      }
      {
        job_name = "node";
        static_configs = [{ targets = [ "127.0.0.1:9100" ]; }];
      }
    ];
  };

  # Export basic host metrics
  services.prometheus.exporters.node = {
    enable = true;
    port = 9100;
  };

  ######## Logs (Loki + Promtail) ########
  services.loki = {
    enable = true;
    configuration = {
      server.http_listen_port = 3100;
      auth_enabled = false;
      ingester = { lifecycler = { address = "127.0.0.1"; ring = { kvstore.store = "inmemory"; replication_factor = 1; }; }; };
      schema_config.configs = [{
        from = "2020-10-24";
        store = "boltdb-shipper";
        object_store = "filesystem";
        schema = "v12";
        index = { prefix = "index_"; period = "24h"; };
      }];
      storage_config = {
        boltdb_shipper.active_index_directory = "/var/lib/loki/index";
        boltdb_shipper.cache_location        = "/var/lib/loki/boltdb-cache";
        filesystem.directory                 = "/var/lib/loki/chunks";
      };
      limits_config = { ingestion_burst_size_mb = 16; ingestion_rate_mb = 8; };
    };
  };

  # Ship local logs to Loki
  services.promtail = {
    enable = true;
    configuration = {
      server.http_listen_port = 9080;
      server.grpc_listen_port = 0;
      clients = [{ url = "http://127.0.0.1:3100/loki/api/v1/push"; }];
      scrape_configs = [
        {
          job_name = "journal";
          journal = { max_age = "12h"; labels = { job = "systemd-journal"; }; };
          relabel_configs = [{ source_labels = ["__journal__systemd_unit"]; target_label = "unit"; }];
        }
      ];
    };
  };

  ######## Traces (Tempo) ########
  services.tempo = {
    enable = true;
    settings = {
      server.http_listen_port = 3200;   # Grafana datasource URL
      storage = { trace = { backend = "local"; local.path = "/var/lib/tempo/traces"; }; };
      # Enable OTLP receivers so apps/agents can send traces
      receiver = {
        otlp = {
          protocols = {
            http = { endpoint = "127.0.0.1:4318"; };
            grpc = { endpoint = "127.0.0.1:4317"; };
          };
        };
        # (Jaeger/Zipkin receivers can be added similarly if you need them)
      };
      metrics_generator.enabled = false; # keep minimal
    };
  };

  ######## Grafana (UI) ########
  services.grafana = {
    enable = true;
    settings.server = {
      http_addr = "127.0.0.1";   # change to "0.0.0.0" to reach from LAN
      http_port = 3000;
    };
    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          access = "proxy";
          url = "http://127.0.0.1:9090";
          isDefault = true;
        }
        {
          name = "Loki";
          type = "loki";
          access = "proxy";
          url = "http://127.0.0.1:3100";
        }
        {
          name = "Tempo";
          type = "tempo";
          access = "proxy";
          url = "http://127.0.0.1:3200";
          jsonData = {
            httpMethod = "GET";
            serviceMap = { datasourceUid = "Prometheus"; };
            tracesToLogs = {
              datasourceUid = "Loki";
              tags = ["job" "unit"];       # which labels to pass when jumping to logs
              mappedTags = [{ key = "service.name"; value = "service"; }];
            };
          };
        }
      ];
    };
  };
}
