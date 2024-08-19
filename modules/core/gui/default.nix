{ lib, hostname, ... }:
{
  imports = [
    ./alvr.nix
    ./anime-games.nix
    ./blueman.nix
    ./droidcam.nix
    # ./kde6.nix
    ./opengl.nix
    ./steam.nix
  ]
  ++ (lib.lists.optionals (hostname == "ShadowMoses") [
    ./hyprland.nix
    ./sway.nix
    ./gdm.nix
    # ./cosmic.nix
  ])
  ++ (lib.lists.optionals (hostname == "BigShell") [
    ./hyprland.nix
    ./gdm.nix
  ])
  ++ (lib.lists.optionals (hostname == "Tanker") [
    ./gnome.nix
  ]);
}
