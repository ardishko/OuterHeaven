{ pkgs, ... }:
{
  # Install the package
  home.packages = [ pkgs.nextcloud-client ];

  systemd.user.services.nextcloud-client = {
    Unit = {
      Description = "Nextcloud Client";
      After = "graphical-session.target";
    };
    Install = {
      WantedBy = [ "default.target" ]; # Starts always, not just in graphical session
    };
    Service = {
      ExecStart = "${pkgs.nextcloud-client}/bin/nextcloud --background";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
