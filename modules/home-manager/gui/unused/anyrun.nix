{ inputs, pkgs, ... }:
{
  imports = [ inputs.anyrun.homeManagerModules.default ];
  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.shell
        inputs.anyrun.packages.${pkgs.system}.translate
        inputs.anyrun.packages.${pkgs.system}.websearch
        inputs.anyrun.packages.${pkgs.system}.dictionary
        inputs.anyrun.packages.${pkgs.system}.kidex
      ];
      x = {
        fraction = 0.5;
      };
      y = {
        fraction = 0.0;
      };
      hideIcons = false;
      layer = "overlay";
      width = {
        absolute = 800;
      };
      height = {
        absolute = 0;
      };
      ignoreExclusiveZones = false;
      hidePluginInfo = false;
      closeOnClick = false;
      maxEntries = 10;
      showResultsImmediately = true;
    };
    extraCss = null;
    extraConfigFiles."websearch.ron".text = ''
      Config(
        prefix: "?",
      // Options: Google, Ecosia, Bing, DuckDuckGo, Custom
      //
      // Custom engines can be defined as such:
        Custom(
           name: "Brave",
           url: "https://search.brave.com/search?q={}",
        )
        //
        // NOTE: `{}` is replaced by the search query and `https://` is automatically added in front.
       engines: [Brave]
      )
    '';
  };
}
