{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ((pkgs.discord-canary.override {
      withVencord = true;
      #withOpenASAR = true;
    }).overrideAttrs {
      desktopItems = [
        (makeDesktopItem {
          name = "discordcanary";
          desktopName = "Discord Canary";
          exec = "mullvad-exclude discordcanary";
          icon = "discord-canary";
        })
      ];
      src = fetchurl {
        url = "https://dl-canary.discordapp.net/apps/linux/0.0.267/discord-canary-0.0.267.tar.gz";
        hash = "sha256-Hq78SDer7Gb+ju8wk9DrMLisHnoYoSwTzrs8PKhbS3s=";
      };
      # installPhase = ''bash -c "$(curl https://raw.githubusercontent.com/fuwwy/Discord-Screenshare-Linux/main/scripts/install.sh -sSfL)"'';
    })
  ];
}
