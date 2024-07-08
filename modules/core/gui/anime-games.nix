{ inputs, ... }:
{
  imports = [ inputs.anime-games.nixosModules.default ];
  programs = {
    anime-games-launcher.enable = true;
    sleepy-launcher.enable = true;
  };
  nix.settings = inputs.anime-games.nixConfig;

  # what the fuck is this nixos module this is horrible
}

