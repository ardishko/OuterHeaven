{ pkgs, inputs, ... }:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  programs.spicetify = {
    enable = true;
    theme = {
      name = "text";
      src = pkgs.fetchFromGitHub {
          owner = "ardishko";
          repo = "spicetify-themes";
          rev = "726097a544172523cdae15da8d3c84032aec8c3b";
          hash = "sha256-mQgkmbkgzfWlT1iv4jB/cw95v4q0/+57B9rgmezAY34=";
        };
      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      homeConfig = true;
      overwriteAssets = false;
    };
    colorScheme = "";
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
      fullScreen
      skipStats
      volumePercentage
      history
      copyToClipboard
      showQueueDuration
      songStats
      playlistIcons
      groupSession
      skipOrPlayLikedSongs
      seekSong
      powerBar
    ];
  };
}
