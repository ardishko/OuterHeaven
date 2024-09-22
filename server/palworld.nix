{ pkgs, lib, ... }:
with lib;
{
  programs.nix-ld.enable = true;
  users.users.palworld = {
    home = "/var/lib/palworld";
    createHome = true;
    isSystemUser = true;
    group = "palworld";
  };
  users.groups.palworld = { };

  # boot.kernel.sysctl."net.ipv6.conf.eth0.disable_ipv6" = true;
  networking.enableIPv6 = false;

  # nixpkgs.config.allowUnfree = true;
  #
  # networking = {
  #   firewall = {
  #     allowedUDPPorts = [15777 15000 7777 27015];
  #     allowedUDPPortRanges = [
  #       {
  #         from = 27031;
  #         to = 27036;
  #       }
  #     ];
  #     allowedTCPPorts = [27015 27036];
  #   };
  # };

  # -beta experimental \
  systemd.services.palworld = {
    enable = true;
    preStart = ''
      ${pkgs.steamcmd}/bin/steamcmd \
        +force_install_dir /var/lib/palworld/PalworldServer \
        +login anonymous \
        +app_update 2394010 \
        validate \
        +quit
      # mkdir -p ~/.steam/sdk64/
      # steamcmd +login anonymous +app_update 1007 +quit
      # cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/
    '';
    script = ''
      ${pkgs.steam-run}/bin/steam-run /var/lib/palworld/PalworldServer/PalServer.sh
      # /var/lib/palworld/PalworldServer/PalServer.sh
    '';
    serviceConfig = {
      Nice = "-5";
      Restart = "always";
      User = "palworld";
      WorkingDirectory = "/var/lib/palworld";
    };
  };
}
