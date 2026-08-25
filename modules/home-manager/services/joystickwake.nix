{ pkgs, ... }:

{
  systemd.user.services.joystickwake = {
    Unit = {
      Description = "Wake screen on joystick/gamepad activity";
      Documentation = "https://codeberg.org/forestix/joystickwake";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
      StartLimitIntervalSec = 0;
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.joystickwake}/bin/joystickwake";
      Restart = "always";
      RestartSec = 3;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
