{ inputs, pkgs, ... }:
{
  imports = [ inputs.nixos-cosmic.nixosModules.default ];

  services.desktopManager.cosmic.enable = true;
  environment.cosmic.excludePackages = [
    pkgs.cosmic-edit
    pkgs.cosmic-store
  ];
}
