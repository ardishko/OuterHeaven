{ pkgs, ... }:
{
  systemd.services.zapret = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" "systemd-resolved.service" ];
    serviceConfig = {
      ExecStart = "${pkgs.zapret}/bin/zapret start";
      Restart = "always";
      User = "";
      Group = "zapret";
    };
  };
}
