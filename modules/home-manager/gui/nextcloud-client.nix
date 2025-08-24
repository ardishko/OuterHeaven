{ pkgs, ... }:
{
  services.nextcloud-client = {
    enable = true;
    package = pkgs.nextcloud-client;
    startInBackground = true;
  };
  systemd.user.services.nextcloud-client.Unit.After = [
    "graphical-session.target"
    "kwallet.service"
  ];
  systemd.user.services.nextcloud-client.Unit.Wants = [ "kwallet.service" ];
}
