{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.rclone-bisync;

  mkBisyncService = name: path: remote: {
    Unit.Description = "Bisync ${name}";
    Service.ExecStart = "${pkgs.rclone}/bin/rclone bisync ${path} ${cfg.remoteName}:${remote} --resync-mode newer --conflict-resolve newer --resilient --recover --create-empty-src-dirs -v";
  };

  mkBisyncTimer = name: {
    Unit.Description = "Sync ${name} every ${toString cfg.interval}";
    Timer = {
      OnBootSec = cfg.bootDelay;
      OnUnitActiveSec = cfg.interval;
    };
    Install.WantedBy = [ "timers.target" ];
  };

  mkResyncCommand =
    path: remote: "${pkgs.rclone}/bin/rclone bisync ${path} ${cfg.remoteName}:${remote} --resync -v";

in
{
  options.services.rclone-bisync = {
    enable = mkEnableOption "rclone bisync";

    remoteName = mkOption {
      type = types.str;
      default = "nextcloud";
      description = "Name of the rclone remote to sync with";
    };

    interval = mkOption {
      type = types.str;
      default = "2min";
      description = "How often to run bisync";
    };

    bootDelay = mkOption {
      type = types.str;
      default = "30sec";
      description = "Delay after boot before first sync";
    };

    paths = mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            local = mkOption {
              type = types.str;
              description = "Local path to sync";
            };
            remote = mkOption {
              type = types.str;
              description = "Remote path to sync to";
            };
          };
        }
      );
      default = { };
      description = "Paths to bisync";
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services =
      (mapAttrs' (
        name: opts: nameValuePair "rclone-bisync-${name}" (mkBisyncService name opts.local opts.remote)
      ) cfg.paths)
      // {
        rclone-bisync-init = {
          Unit = {
            Description = "Initialize all bisync pairs";
            ConditionPathExists = "!%h/.config/rclone-bisync-initialized";
          };
          Service = {
            Type = "oneshot";
            ExecStart = pkgs.writeShellScript "rclone-bisync-init" ''
              set -e
              ${concatStringsSep "\n" (
                mapAttrsToList (name: opts: mkResyncCommand opts.local opts.remote) cfg.paths
              )}
              touch ${config.home.homeDirectory}/.config/rclone-bisync-initialized
            '';
          };
          Install.WantedBy = [ "default.target" ];
        };
      };

    systemd.user.timers = mapAttrs' (
      name: opts: nameValuePair "rclone-bisync-${name}" (mkBisyncTimer name)
    ) cfg.paths;
  };
}
