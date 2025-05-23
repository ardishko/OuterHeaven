{ inputs, username, ... }:
{
  imports = [ inputs.jovian-nixos.nixosModules.default ];
  # Jovian NixOS options, specific to the deck
  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      user = "${username}";
      desktopSession = "plasma";
    };
    devices = {
      steamdeck = {
        enable = true;
        enableGyroDsuService = true;
      };
    };
    decky-loader = {
      enable = true;
      user = "${username}";
      stateDir = "/var/lib/decky-loader";
    };
    steamos = {
      useSteamOSConfig = true;
    };
  };
}
