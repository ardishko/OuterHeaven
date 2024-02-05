{
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      builders-use-substitutes = true;
      # substituters to use
      substituters = [
        "https://anyrun.cachix.org"
        "https://hyprland.cachix.org"
        "https://ezkea.cachix.org"
      ];

      trusted-public-keys = [
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];
    };
  };
}
