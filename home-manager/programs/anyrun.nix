{ config, user, self, inputs, pkgs, ... }:
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
          ];
        x = { fraction = 0.5; };
        y = { fraction = 0.0; };
        hideIcons = false;
        layer = "overlay";
        width = { absolute = 800; };
        height = { absolute = 0; };
        ignoreExclusiveZones = false;
        hidePluginInfo = false;
        closeOnClick = false;
        maxEntries = 10;
        showResultsImmediately = true;
        };
        extraCss = null;
    };

}