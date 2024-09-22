{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      gamescopeSession.enable = true;
      platformOptimizations.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
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
        };
        #   .overrideAttrs (old: {
        #     desktopItems = [
        #       (pkgs.makeDesktopItem {
        #         name = "steam";
        #         desktopName = "Steam (mullvad-exclude)";
        #         exec = "mullvad-exclude steam";
        #         icon = "steam";
        #     })
        #   ];  
        # });
        # the custom desktop entry is in modules/home-manager/xdg.nix 
      };
    };
  };
  nixpkgs.overlays = [
    (_final: prev: {
      steam = prev.steam.override ({ extraLibraries ? _pkgs': [ ], ... }: {
        extraLibraries = pkgs': (extraLibraries pkgs') ++ [
          pkgs'.gperftools
        ];
      });
    })
  ];
}
