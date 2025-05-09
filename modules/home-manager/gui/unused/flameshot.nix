{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.flameshot.overrideAttrs {
      # src = pkgs.fetchFromGitHub {
      #   owner = "flameshot-org";
      #   repo = "flameshot";
      #   rev = "14a136777cd82ab70f42c13b4bc9418c756d91d2";
      #   sha256 = "sha256-xM99adstwfOOaeecKyWQU3yY0p65pQyFgoz7WJNra98=";
      # };
      cmakeFlags = [
        "-DUSE_WAYLAND_GRIM=True"
        "-DUSE_WAYLAND_CLIPBOARD=1"
      ];
      buildInputs = with pkgs; [ libsForQt5.kguiaddons ];
    })
  ];
}
