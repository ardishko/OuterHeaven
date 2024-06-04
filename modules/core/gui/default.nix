{ lib, hostname, ... }:
{
  imports = [
    ./alvr.nix
    ./anime-games.nix
    ./blueman.nix
    ./droidcam.nix
    ./gdm.nix
    ./hyprland.nix
    # ./kde6.nix
    ./opengl.nix
    ./steam.nix
    ./sway.nix
  ]
   ++ (lib.lists.optionals (hostname == "Tanker") [
     ./gnome.nix
     ./kde6.nix
   ]);
}
