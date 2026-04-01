{
  inputs,
  username,
  config,
  ...
}:
{
  imports = [ inputs.jovian-nixos.nixosModules.default ];
  # Jovian NixOS options, specific to the deck
  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      user = "${username}";
      desktopSession = "plasma";
      updater = {
        splash = "steamos";
      };
    };
    devices = {
      steamdeck = {
        enable = true;
        enableGyroDsuService = true;
        enableSoundSupport = true;
        enableVendorDrivers = true;
        enableXorgRotation = true;
      };
    };
    decky-loader = {
      enable = true;
      user = "${username}";
      stateDir = "/var/lib/decky-loader";
    };
    steamos = {
      useSteamOSConfig = true;
      enableAutoMountUdevRules = true;
      enableBluetoothConfig = true;
    };
  };
  # Create Steam CEF debugging file if it doesn't exist for Decky Loader.
  systemd.services.steam-cef-debug = {
    description = "Create Steam CEF debugging file";
    serviceConfig = {
      Type = "oneshot";
      User = config.jovian.steam.user;
      ExecStart = "/bin/sh -c 'mkdir -p ~/.steam/steam && [ ! -f ~/.steam/steam/.cef-enable-remote-debugging ] && touch ~/.steam/steam/.cef-enable-remote-debugging || true'";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
