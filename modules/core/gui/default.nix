{ lib, hostname, ... }:
{
  imports =
    [
      ./alvr.nix
      ./anime-games.nix
      ./droidcam.nix
      ./opengl.nix
      ./steam.nix
      ./blueman.nix
    ]
    ++ (lib.lists.optionals (hostname == "ShadowMoses" || hostname == "BigShell" || hostname == "Kamurocho") [
      # ./hyprland.nix
      ./sddm.nix
      ./kde6.nix
    ])
    ++ (lib.lists.optionals (hostname == "Tanker") [ ./kde6.nix ]);
}
