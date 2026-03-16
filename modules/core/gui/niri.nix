{ inputs, ... }:
{
  imports = [ inputs.niri-nix.nixosModules.default ];
  programs.niri = {
    enable = true;
    withUWSM = true;
    withXDG = true;
  };
}
