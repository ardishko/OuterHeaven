{ lib, ... }:
with lib;
{
  users.users.parrot = {
    home = "/var/lib/parrot";
    createHome = true;
    isSystemUser = true;
    group = "parrot";
  };
  users.groups.parrot = { };

  # boot.kernel.sysctl."net.ipv6.conf.eth0.disable_ipv6" = true;
  networking.enableIPv6 = false;

  # -beta experimental \
  systemd.services.parrot = {
    enable = true;
    script = ''
      ${pkgs.parrot}/bin/parrot
    '';
    serviceConfig = {
      Nice = "-5";
      Restart = "always";
      User = "parrot";
      WorkingDirectory = "/var/lib/parrot";
    };
  };
}
