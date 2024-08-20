{
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/lib/bitwarden_rs/backup";
    config = {
        ROCKET_ADDRESS = "0.0.0.0";
        ROCKET_PORT = 8222;
	DOMAIN = "https://pass.ardishco.net";
	ROCKET_LOG = "critical";
	SIGNUPS_ALLOWED = false;
    };
  };
}
