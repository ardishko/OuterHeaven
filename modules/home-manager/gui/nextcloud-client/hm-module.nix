{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.nextcloud-sync;

  # Generate folder entries for the config file
  mkFolderEntry = idx: folder: ''
    0\Folders\${toString idx}\ignoreHiddenFiles=false
    0\Folders\${toString idx}\journalPath=.sync_${builtins.hashString "md5" folder.local}.db
    0\Folders\${toString idx}\localPath=${folder.local}
    0\Folders\${toString idx}\paused=false
    0\Folders\${toString idx}\targetPath=${folder.remote}
    0\Folders\${toString idx}\version=2
    0\Folders\${toString idx}\virtualFilesMode=off
  '';

  folderEntries = concatStringsSep "\n" (imap1 mkFolderEntry cfg.folders);

  # Generate sync-exclude.lst file
  excludeFile = pkgs.writeText "sync-exclude.lst" (concatStringsSep "\n" cfg.excludePatterns);

  # Setup script that creates a complete config with auth
  setupScript = pkgs.writeShellScript "nextcloud-manual-setup" ''
    set -e

    CONFIG_DIR="${config.home.homeDirectory}/.config/Nextcloud"
    CONFIG_FILE="$CONFIG_DIR/nextcloud.cfg"

    mkdir -p "$CONFIG_DIR"

    ${optionalString (cfg.usernameFile == null || cfg.passwordFile == null) ''
      echo "ERROR: No credentials configured!"
      echo "Please set usernameFile and passwordFile options in your Nextcloud config."
      echo ""
      echo "Example:"
      echo "  mkdir -p ~/.secrets"
      echo "  echo -n 'your-username' > ~/.secrets/nextcloud-username"
      echo "  echo -n 'your-password' > ~/.secrets/nextcloud-password"
      echo "  chmod 600 ~/.secrets/nextcloud-*"
      exit 1
    ''}

    ${optionalString (cfg.usernameFile != null && cfg.passwordFile != null) ''
          # Read credentials
          if [ ! -f "${cfg.usernameFile}" ]; then
            echo "Error: Username file not found: ${cfg.usernameFile}"
            exit 1
          fi

          if [ ! -f "${cfg.passwordFile}" ]; then
            echo "Error: Password file not found: ${cfg.passwordFile}"
            exit 1
          fi

          USERNAME=$(cat "${cfg.usernameFile}" | tr -d '\n')
          PASSWORD=$(cat "${cfg.passwordFile}" | tr -d '\n')

          # Read display name (use username if not provided)
          if [ -f "${toString cfg.displayNameFile}" ]; then
            DISPLAYNAME=$(cat "${toString cfg.displayNameFile}" | tr -d '\n')
          else
            DISPLAYNAME="$USERNAME"
          fi

          echo "Creating Nextcloud configuration for user: $USERNAME"
          if [ "$DISPLAYNAME" != "$USERNAME" ]; then
            echo "Display name: $DISPLAYNAME"
          fi

          # Kill any running nextcloud processes
          pkill -u $USER nextcloud || true
          sleep 1

          # Write complete config file
          cat > "$CONFIG_FILE" << CONFIGEOF
      [General]
      clientPreviousVersion=4.0.3
      clientVersion=4.0.3
      confirmExternalStorage=true
      crashReporter=true
      isVfsEnabled=false
      launchOnSystemStartup=${if cfg.launchOnStartup then "true" else "false"}
      monoIcons=false
      moveToTrash=${if cfg.moveToTrash then "true" else "false"}
      newBigFolderSizeLimit=500
      notifyExistingFoldersOverLimit=false
      optionalServerNotifications=true
      promptDeleteAllFiles=false
      showCallNotifications=true
      showChatNotifications=true
      showInExplorerNavigationPane=false
      showQuotaWarningNotifications=true
      stopSyncingExistingFoldersOverLimit=false
      useNewBigFolderSizeLimit=true

      [Accounts]
      ${folderEntries}
      0\\authType=webflow
      0\\dav_user=$USERNAME
      0\\displayName=$DISPLAYNAME
      0\\http_user=$USERNAME
      0\\url=${cfg.serverUrl}
      0\\user=$USERNAME
      0\\webflow_user=$USERNAME
      version=1
      CONFIGEOF

          chmod 644 "$CONFIG_FILE"

          echo "Configuration created with ${toString (length cfg.folders)} folder(s)"
          echo ""
          echo "Now starting Nextcloud client for authentication..."
          echo "A browser window will open. Please log in to complete setup."
          echo ""

          # Start nextcloud in foreground to complete webflow authentication
          ${cfg.package}/bin/nextcloud --logfile /tmp/nextcloud-setup.log &
          NEXTCLOUD_PID=$!

          echo "Waiting for authentication (this may take a minute)..."
          echo "After logging in through your browser, the client will sync and this script will complete."

          # Wait for authentication to complete (check for auth tokens in config)
          for i in {1..60}; do
            if grep -q "http_oauth" "$CONFIG_FILE" 2>/dev/null || grep -q "password" "$CONFIG_FILE" 2>/dev/null; then
              echo ""
              echo "Authentication successful!"
              kill $NEXTCLOUD_PID 2>/dev/null || true
              sleep 2
              break
            fi
            sleep 2
            echo -n "."
          done

          echo ""
          echo "Setup complete! Your Nextcloud client is configured."
          echo ""
          echo "You can now start the service with:"
          echo "  systemctl --user start nextcloud-client"
    ''}
  '';

in
{
  options.services.nextcloud-sync = {
    enable = mkEnableOption "Nextcloud sync client with multiple folders";

    package = mkOption {
      type = types.package;
      default = pkgs.nextcloud-client;
      description = "Nextcloud client package to use";
    };

    serverUrl = mkOption {
      type = types.str;
      example = "https://nextcloud.example.com";
      description = "Nextcloud server URL";
    };

    usernameFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = "/home/user/.secrets/nextcloud-username";
      description = ''
        Path to a file containing the Nextcloud username (login name).
        The file should contain only the username with no trailing newline.
        Use: echo -n 'username' > ~/.secrets/nextcloud-username
      '';
    };

    displayNameFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = "/home/user/.secrets/nextcloud-displayname";
      description = ''
        Path to a file containing the Nextcloud display name.
        If not set, will use the same value as usernameFile.
        The file should contain only the display name with no trailing newline.
        Use: echo -n 'Display Name' > ~/.secrets/nextcloud-displayname
      '';
    };

    passwordFile = mkOption {
      type = types.nullOr types.path;
      default = null;
      example = "/home/user/.secrets/nextcloud-password";
      description = ''
        Path to a file containing the Nextcloud password.
        The file should contain only the password with no trailing newline.
        Use: echo -n 'password' > ~/.secrets/nextcloud-password
      '';
    };

    folders = mkOption {
      type = types.listOf (
        types.submodule {
          options = {
            local = mkOption {
              type = types.str;
              description = "Local folder path (must end with /)";
            };
            remote = mkOption {
              type = types.str;
              description = "Remote path on Nextcloud server";
            };
          };
        }
      );
      default = [ ];
      description = "List of folder pairs to sync";
      example = [
        {
          local = "/home/user/.local/share/game/saves/";
          remote = "/Saves/Game";
        }
      ];
    };

    excludePatterns = mkOption {
      type = types.listOf types.str;
      default = [
        "*.~lock.*"
        "~$*"
        ".~lock.*"
        "*.part"
        "*.crdownload"
      ];
      description = "Patterns to exclude from sync";
    };

    launchOnStartup = mkOption {
      type = types.bool;
      default = true;
      description = "Launch Nextcloud client on system startup";
    };

    moveToTrash = mkOption {
      type = types.bool;
      default = false;
      description = "Move deleted files to trash instead of permanent deletion";
    };

    autoRestart = mkOption {
      type = types.bool;
      default = true;
      description = "Automatically restart on crashes";
    };

    restartOnSessionChange = mkOption {
      type = types.bool;
      default = true;
      description = "Restart when switching between desktop/gamemode";
    };

    startInBackground = mkOption {
      type = types.bool;
      default = true;
      description = "Start minimized to system tray";
    };

    environment = mkOption {
      type = types.attrsOf types.str;
      default = { };
      example = {
        QT_QPA_PLATFORM = "offscreen";
        DISPLAY = "";
      };
      description = ''
        Environment variables to set for the Nextcloud client service.
        Useful for running headless. For headless operation, set:
        QT_QPA_PLATFORM = "offscreen" and optionally DISPLAY = "".
      '';
    };
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = all (f: hasSuffix "/" f.local) cfg.folders;
        message = "All local folder paths must end with '/' for Nextcloud client compatibility";
      }
    ];

    home.packages = [
      cfg.package
      (pkgs.writeScriptBin "nextcloud-setup" ''
        #!${pkgs.bash}/bin/bash
        exec ${setupScript}
      '')
    ];

    # Create local folders
    home.file = listToAttrs (
      map (folder: {
        name = "${removeSuffix "/" folder.local}/.keep";
        value = {
          text = "";
        };
      }) cfg.folders
    );

    # Install sync-exclude.lst
    home.activation.nextcloudConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      NEXTCLOUD_DIR="${config.home.homeDirectory}/.config/Nextcloud"
      mkdir -p "$NEXTCLOUD_DIR"

      # Always update sync-exclude.lst
      $DRY_RUN_CMD rm -f "$NEXTCLOUD_DIR/sync-exclude.lst"
      $DRY_RUN_CMD cp ${excludeFile} "$NEXTCLOUD_DIR/sync-exclude.lst"
      $DRY_RUN_CMD chmod 644 "$NEXTCLOUD_DIR/sync-exclude.lst"

      # Check if setup is needed
      if [ ! -f "$NEXTCLOUD_DIR/nextcloud.cfg" ]; then
        echo "Nextcloud not configured yet. Run 'nextcloud-setup' to configure."
      elif ! grep -q "0\\\\Folders\\\\1\\\\localPath" "$NEXTCLOUD_DIR/nextcloud.cfg"; then
        echo "Nextcloud config exists but folders not configured. Run 'nextcloud-setup' again."
      fi
    '';

    systemd.user.services.nextcloud-client = {
      Unit = {
        Description = "Nextcloud Sync Client";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${cfg.package}/bin/nextcloud${optionalString cfg.startInBackground " --background"}";
        Restart = if cfg.autoRestart then "always" else "on-failure";
        RestartSec = "5s";
        Environment = mapAttrsToList (name: value: "${name}=${value}") cfg.environment;
      };
      Install.WantedBy = [ "default.target" ];
    };

    # Session change detection and restart
    systemd.user.paths.nextcloud-restart-trigger = mkIf cfg.restartOnSessionChange {
      Unit.Description = "Restart Nextcloud on session change";
      Path = {
        PathModified = [
          "/run/user/%U/wayland-0"
          "/tmp/.X11-unix"
        ];
      };
      Install.WantedBy = [ "default.target" ];
    };

    systemd.user.services.nextcloud-restart = mkIf cfg.restartOnSessionChange {
      Unit.Description = "Restart Nextcloud client";
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.systemd}/bin/systemctl --user restart nextcloud-client";
      };
    };
  };
}
