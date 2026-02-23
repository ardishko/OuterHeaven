{ inputs, pkgs, ... }:
{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
  services.wivrn = {
    enable = true;
    package = inputs.unstable.legacyPackages.${pkgs.system}.wivrn;
    openFirewall = true;
    defaultRuntime = true;
  };
}
