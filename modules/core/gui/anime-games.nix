{ inputs, ... }:
{
  imports = [ inputs.anime-games.nixosModules.default ];
  programs = {
    # honkers-railway-launcher.enable = true;
  };
  nix.settings = inputs.anime-games.nixConfig;

  # what the fuck is this nixos module this is horrible
}
