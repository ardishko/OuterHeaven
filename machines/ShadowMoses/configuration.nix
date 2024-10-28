# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ pkgs, ... }:
{
  # Define your hostname.
  networking.hostName = "ShadowMoses";
  networking.hostId = "69fbbf79";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.vaporsnake = {
  #   isNormalUser = true;
  #   description = "vaporsnake";
  #   extraGroups = [
  #     "networkmanager"
  #     "wheel"
  #   ];
  #   packages = [ ];
  #   shell = pkgs.zsh;
  #   ignoreShellProgramCheck = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
}
