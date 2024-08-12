{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.byedpi;

  byedpi = pkgs.callPackage ({
    stdenv,
    pkgs,
    fetchFromGitHub,
    lib,
  }:
    stdenv.mkDerivation rec {
      name = "byedpi";

      version = "0.11.1";

      src = fetchFromGitHub {
        owner = "hufrea";
        repo = "byedpi";
        rev = "f4c55af73aefeec55b5cbc557c9641af3682dc47";

        sha256 = "sha256-hsyCBpq/7PKqMwAjGrCBKIszJD2nV34xdlKme2XIa3o=";
      };

      buildPhase = ''

        mkdir obj

        $CC -std=c99 -O2 -D_XOPEN_SOURCE=500 packets.c main.c conev.c proxy.c desync.c mpool.c extend.c -I . -o ciadpi

      '';

      installPhase = ''

        mkdir -p $out/bin

        install -m 755 ciadpi $out/bin

      '';
    }) {};

  meta = with lib; {
    description = " Bypass DPI";

    longDescription = " Bypass DPI";

    homepage = "https://github.com/hufrea/byedpi";

    platforms = platforms.all;
  };
in {
  options.services.byedpi = {
    enable = mkEnableOption "byedpi socks4 server";

    openFirewall = mkOption {
      type = types.bool;

      default = false;

      description = "Whether to open a firewalls port.";
    };

    commandLine = mkOption {
      type = types.str;

      description = "Command Line";
    };

    address = mkOption {
      type = types.str;

      default = "127.0.0.1";

      description = "Listening IP, default is set to 127.0.0.1 for sake of security";
    };

    socksPort = mkOption {
      type = types.port;

      default = 1080;

      example = 8080;

      description = "Listening port";
    };
  };

  config = mkIf cfg.enable {
    systemd.services.byedpi = {
      description = "Bypass DPI socks4 server";

      requires = ["network.target"];

      wantedBy = ["default.target"];
      serviceConfig = {
        ExecStart = "${byedpi}/bin/ciadpi -ip ${config.services.byedpi.address} -p ${
          toString config.services.byedpi.socksPort
        } ${config.services.byedpi.commandLine} ";
        Type = "exec";
        PIDFile = "/run/ciadpi.pid";
        ExecReload = "/bin/kill -HUP $MAINPID";
        Restart = "always";
        RestartSec = "5s";
      };
    };

    networking.firewall = {
      allowedTCPPorts = with cfg; optionals openFirewall [socksPort];
    };

    environment = {systemPackages = [byedpi];};
  };
}
