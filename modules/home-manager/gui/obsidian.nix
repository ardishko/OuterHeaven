{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.obsidian.overrideAttrs {
      desktopItem = [
        (makeDesktopItem {
          name = "obsidian";
          desktopName = "Obsidian";
          comment = "Knowledge base";
          icon = "obsidian";
          exec = "obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland";
          categories = ["Office"];
          mimeTypes = ["x-scheme-handler/obsidian"];
        })
      ];
    })
  ];
}
