{ pkgs, ... }:
{
  # services.nextcloud-client = {
  #   enable = true;
  #   package = pkgs.nextcloud-client;
  #   startInBackground = true;
  # };
  # systemd.user.services.nextcloud-client.Unit.After = [
  #   "graphical-session.target"
  #   "kwallet.service"
  # ];
  # systemd.user.services.nextcloud-client.Unit.Wants = [ "kwallet.service" ];

  # Install the package
  home.packages = [ pkgs.nextcloud-client ];

  systemd.user.services = {
    nextcloud-gamemode = {
      Unit = {
        Description = "Nextcloud Client (Game Mode - Headless)";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };

      Service = {
        Environment = "QT_QPA_PLATFORM=offscreen";
        ExecStart = "${pkgs.nextcloud-client}/bin/nextcloud --background";
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };

    nextcloud-desktop = {
      Unit = {
        Description = "Nextcloud Client (Desktop Mode - GUI)";
        Conflicts = "nextcloud-gamemode.service";
        After = "graphical-session.target";
      };

      Install = {
        WantedBy = [ "graphical-session.target" ];
      };

      Service = {
        ExecStart = "${pkgs.nextcloud-client}/bin/nextcloud --background";
        Restart = "on-failure";
        RestartSec = "5s";
      };
    };
  };
}
