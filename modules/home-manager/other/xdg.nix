{ lib, pkgs, inputs, ... }:
let
  steamDeckScript = pkgs.writeShellScript "steam-deck-launcher" ''
    #!/usr/bin/env bash
    read -r W H <<< $("${pkgs.kdePackages.kscreen}/bin/kscreen-doctor" -o | grep "Mode" | head -n1 | "${pkgs.gawk}/bin/awk" '{print $2}' | tr x ' ')
    "${pkgs.mullvad}/bin/mullvad-exclude" "${pkgs.gamescope}/bin/gamescope" --expose-wayland -f -W "$W" -H "$H" -- "${pkgs.steam}/bin/steam" -gamepadui "$@"
  '';
in
{
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
      "x-scheme-handler/magnet" = [ "mpv.desktop" ];
      "x-scheme-handler/curseforge" = [ "prismlauncher.desktop" ];
      "application/x-doom" = [ "gzdoom.desktop" ];
      "x-scheme-handler/steam" = [ "steam.desktop" ];
      };
    };
    desktopEntries = {
      "steam" = lib.mkForce {
        name = "Steam";
        type = "Application";
        icon = "steam";
        terminal = false;
        exec = "mullvad-exclude steam %u";
        mimeType = [ "x-scheme-handler/steam" ];
      };
      "steam-deck" = {
        name = "Steam (Deck Mode)";
        type = "Application";
        icon = "steam";
        exec = ''
          ${steamDeckScript}
        '';
        terminal = false;
        categories = [ "Game" ];
      };
    };
  };
  # We'll do autostart like this, because the xdg.autostart option tries to override the entire autostart folder, which keeps some important stuff like scripts if you use plasma-manager.
    home.file = {
      ###########################
      # Zen Browser (Beta)
      ###########################
      ".config/autostart/zen-beta.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Zen Browser (Beta)
        Exec=${inputs.zen-browser.packages.${pkgs.system}.default}/bin/zen-beta
        X-GNOME-Autostart-enabled=true
        Comment=Start Zen Browser automatically at login
      '';

      ###########################
      # Discord (Mullvad Exclude)
      ###########################
      ".config/autostart/discord.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Discord (VPN Excluded)
        Exec=${pkgs.mullvad}/bin/mullvad-exclude ${pkgs.discord}/bin/discord
        X-GNOME-Autostart-enabled=true
        Comment=Launch Discord excluded from Mullvad VPN
      '';

      ###########################
      # Steam (Mullvad Exclude)
      ###########################
      ".config/autostart/steam.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Steam (VPN Excluded)
        Exec=${pkgs.mullvad}/bin/mullvad-exclude ${pkgs.steam}/bin/steam
        X-GNOME-Autostart-enabled=true
        Comment=Launch Steam excluded from Mullvad VPN
      '';

      ###########################
      # Zed Editor
      ###########################
      ".config/autostart/zed.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Zed Editor
        Exec=${pkgs.zed-editor}/bin/zededitor
        X-GNOME-Autostart-enabled=true
        Comment=Start Zed Editor automatically at login
      '';

      ###########################
      # OBS Studio (Mullvad Exclude + Flags)
      ###########################
      ".config/autostart/obs-studio.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=OBS Studio (VPN Excluded)
        Exec=${pkgs.mullvad}/bin/mullvad-exclude ${pkgs.obs-studio}/bin/obs --startreplaybuffer --disable-shutdown-check --minimize-to-tray
        X-GNOME-Autostart-enabled=true
        Comment=Start OBS with replay buffer and minimize to tray
      '';

      ###########################
      # Signal Desktop (Mullvad Exclude + Flags)
      ###########################
      ".config/autostart/signal.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Signal (VPN Excluded)
        Exec=${pkgs.mullvad}/bin/mullvad-exclude ${pkgs.signal-desktop}/bin/signal-desktop --password-store=basic_text --no-sandbox --start-in-tray
        X-GNOME-Autostart-enabled=true
        Comment=Start Signal Desktop with basic password store
      '';
    };
}
