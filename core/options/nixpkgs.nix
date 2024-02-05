{
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "python-2.7.18.7"
      ];
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
