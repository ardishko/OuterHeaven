{ lib, ... }:
{
  users.users.pufferpanel = {
    isSystemUser = true;
    group = "pufferpanel";
    home = "/var/lib/pufferpanel";
  };
  users.groups.pufferpanel = { };
  # this only because of nix-ld,
  # otherwise you'd have to wrap this in FHS which would have you enabling
  # boot.kernel.sysctl."kernel.unprivileged_userns_clone" = 1;
  # which isn't good for security cus it's vulnerable to privilege escalation,
  # however unlikely that is to happen on up-to-date systems, on a homeserver
  # it is best to have a litle peace of mind.
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

  systemd.services.pufferpanel.serviceConfig = {
    DynamicUser = lib.mkForce false;
    User = "pufferpanel";
    Group = "pufferpanel";
  };
}
