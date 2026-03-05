{ inputs, pkgs, ... }:
{
  services.navidrome = {
    enable = true;
    package = inputs.unstable.legacyPackages.${pkgs.system}.navidrome;
    settings = {
      MusicFolder = "/disks/Music";
    };
  };
}
