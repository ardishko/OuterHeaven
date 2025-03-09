{ lib, hostname, ... }:
{
  imports =
    [
      ./alvr.nix
      ./anime-games.nix
      ./droidcam.nix
      ./opengl.nix
      ./steam.nix
    ]
    ++ (lib.lists.optionals (hostname == "ShadowMoses" || hostname == "BigShell") [
      # ./hyprland.nix
      ./sddm.nix
      ./kde6.nix
    ])
    ++ (lib.lists.optionals (hostname == "Tanker") [ ./kde6.nix ]);
}
