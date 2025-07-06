{ pkgs, inputs, ... }:
let
  officialThemesOLD = pkgs.fetchgit {
    url = "https://github.com/ardishco-the-great/spicetify-themes";
    rev = "4d096d1374631cc7188cb5487a7fd34dbb5afdbe";
    sha256 = "sha256-p6lXLdpvO7HC5hL987e1ipgSFaRx0e4GwVu7IkrmA0s=";
  };
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  programs.spicetify = {
    enable = true;
    theme = {
      name = "text";
      src = officialThemesOLD;
      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
      sidebarConfig = true;
    };
    colorScheme = "catppuccinlatte";
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
      adblock
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
    enabledCustomApps = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.apps; [ nameThatTune ];
  };
}
