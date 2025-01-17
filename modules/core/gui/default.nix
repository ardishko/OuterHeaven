{ lib, hostname, ... }:
{
  imports =
    [
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
      ./sddm.nix
      ./kde6.nix
    ])
    ++ (lib.lists.optionals (hostname == "BigShell") [
      ./hyprland.nix
      ./sddm.nix
      ./kde6.nix
    ])
    ++ (lib.lists.optionals (hostname == "Tanker") [ ./kde6.nix ]);
}
