{ inputs, lib, hostname, ... }:
{
  imports = [
    ./dconf.nix
    ./environment
    ./nix
    ./nixpkgs
    ./polkit.nix
    ./xdg.nix
  ]
  ++ (lib.lists.optionals (hostname == "Tanker") [
    ./jovian.nix
  ]);
}
