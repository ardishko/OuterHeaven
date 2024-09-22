{ pkgs, ... }:
{
  users.users.cloudflared = {
    group = "cloudflared";
    isSystemUser = true;
  };
  users.groups.cloudflared = { };

  systemd.services.cloudflared = {
    wantedBy = [ "multi-user.target" ];
    after = [
      "network-online.target"
      "systemd-resolved.service"
    ];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --cred-file /etc/cred/cloudflare-cred.json homeserver";
      Restart = "always";
      User = "cloudflared";
      Group = "cloudflared";
    };
  };
}
