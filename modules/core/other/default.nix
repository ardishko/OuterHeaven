{ lib, hostname, ... }:
{
  imports = [
    ./dconf.nix
    ./env-vars.nix
    ./nix.nix
    ./nixpkgs.nix
    ./polkit.nix
    ./xdg.nix
    ./impermanence.nix
    # ./byedpi
  ]
  ++ (lib.lists.optionals (hostname == "Tanker") [
    ./jovian.nix
  ]);
}
