{ pkgs, ... }:
{
  users.users.cloudflared = {
    group = "cloudflared";
    isSystemUser = true;
  };
  users.groups.cloudflared = { };

  systemd.services.cloudflared = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" "systemd-resolved.service" ];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token=(FIX THIS PART MORON)";
      Restart = "always";
      User = "cloudflared";
      Group = "cloudflared";
    };
  };
}
