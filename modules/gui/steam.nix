{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.steamCompat ];
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      gamescopeSession.enable = true;
      extraCompatPackages = [ 
        inputs.nix-gaming.packages.${pkgs.system}.proton-ge
      ];
    };
  };
  nixpkgs = {
    config = {
      packageOverrides = pkgs: {
        steam = pkgs.steam.override {
          extraPkgs = pkgs:
            with pkgs; [
              xorg.libXcursor
              xorg.libXi
              xorg.libXinerama
              xorg.libXScrnSaver
              libpng
              libpulseaudio
              libvorbis
              stdenv.cc.cc.lib
              libkrb5
              keyutils
            ];
          # desktopItems = [
          #   (makeDesktopItem {
          #     name = "steam";
          #     desktopName = "Steam";
          #     exec = "mullvad-exclude steam";
          #     icon = "steam";
          #   })
          # ];
        };
      };
    };
  };
}
