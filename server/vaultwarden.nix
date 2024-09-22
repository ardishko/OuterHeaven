{
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/lib/bitwarden-backup";
    config = {
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      DOMAIN = "https://vault.ardishco.net";
      ROCKET_LOG = "critical";
      SIGNUPS_ALLOWED = false;
    };
  };
}
