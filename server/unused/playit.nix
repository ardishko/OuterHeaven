{ inputs, pkgs, ... }:
{
  users.users.playit = {
    group = "playit";
    isSystemUser = true;
  };
  users.groups.playit = { };

  systemd.services.playit = {
    wantedBy = [ "multi-user.target" ];
    after = [
      "network-online.target"
      "systemd-resolved.service"
    ];
    serviceConfig = {
      ExecStart = "${
        inputs.flux.packages.${pkgs.system}.playit
      }/bin/playit-cli --secret_path /etc/cred/playit.toml";
      Restart = "always";
      User = "playit";
      Group = "playit";
      WorkingDirectory = "/var/lib/playit";
    };
  };
}
