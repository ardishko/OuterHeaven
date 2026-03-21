{ pkgs, inputs, ... }:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
  programs.spicetify = {
    enable = true;
    theme = {
      name = "text";
      src = pkgs.fetchFromGitHub {
        owner = "spicetify";
        repo = "spicetify-themes";
        rev = "9af41cf91af6f6093c0e060d57264f08f6bb161c";
        hash = "sha256-mP4YXeXtOR7+YA8KmRMOEsxjPhjPiyId1gpatlvK/5M=";
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
      volumePercentage
      history
      showQueueDuration
      songStats
      groupSession
      seekSong
    ];
  };
}
