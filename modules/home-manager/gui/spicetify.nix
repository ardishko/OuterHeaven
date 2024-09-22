{ pkgs, inputs, ... }:
let
  officialThemesOLD = pkgs.fetchgit {
    url = "https://github.com/ardishco-the-great/spicetify-themes";
    rev = "62e2f6d22a02db38567983c7501bf8d87890cfc9";
    sha256 = "sha256-udfdPEwruIStQJ6OQY2bvtkdjdi4/XFKQueM2cWSWa8=";
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
    colorScheme = "CatppuccinLatte";
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
