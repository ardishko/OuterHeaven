{ inputs, username, ... }:
{
  imports = [ inputs.jovian-nixos.nixosModules.default ];
  # Jovian NixOS options, specific to the deck
  jovian = { 
    steam = {
      enable = true;
      autoStart = true;
      user = "${username}";
      desktopSession = "dbus-run-session gnome-session --wayland";
    };
    devices = {
      steamdeck = {
        enable = true;
      };
    };
    decky-loader = {
      enable = true;
    };
  };
}
