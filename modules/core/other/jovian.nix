{ inputs, username, ... }:
{
  imports = [ inputs.jovian-nixos.nixosModules.default ];
  # Jovian NixOS options, specific to the deck
  jovian.steam = {
    enable = true;
    autoStart = true;
    user = "${username}";
    desktopSession = "gamescope-wayland";
  };
}
