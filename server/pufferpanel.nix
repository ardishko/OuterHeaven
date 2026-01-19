{ lib, pkgs, ... }:
let
  pufferpanel-fhs = pkgs.buildFHSEnv {
    name = "pufferpanel-fhs";
    targetPkgs =
      pkgs: with pkgs; [
        glibc
        gcc-unwrapped
        openssl
      ];
    runScript = "${pkgs.pufferpanel}/bin/pufferpanel";
  };
in
{
  users.users.pufferpanel = {
    isSystemUser = true;
    group = "pufferpanel";
    home = "/var/lib/pufferpanel";
  };
  users.groups.pufferpanel = { };

  services.pufferpanel = {
    enable = true;
    environment = {
      PUFFER_WEB_HOST = "0.0.0.0:9000";
      PUFFER_DAEMON_SFTP_HOST = ":5657";
      PUFFER_DAEMON_CONSOLE_BUFFER = "1000";
      PUFFER_DAEMON_CONSOLE_FORWARD = "true";
      PUFFER_PANEL_REGISTRATIONENABLED = "false";
    };
  };

  systemd.services.pufferpanel = {
    serviceConfig = {
      DynamicUser = lib.mkForce false;
      User = "pufferpanel";
      Group = "pufferpanel";
      ExecStart = lib.mkForce "${pufferpanel-fhs}/bin/pufferpanel-fhs";
    };
  };
}
