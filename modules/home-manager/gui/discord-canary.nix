{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (
      (pkgs.discord-canary.override {
        withVencord = true;
        #withOpenASAR = true;
      }).overrideAttrs
      {
        desktopItems = [
          (makeDesktopItem {
            name = "discordcanary";
            desktopName = "Discord Canary";
            exec = "mullvad-exclude discordcanary --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo,MiddleClickAutoscroll,UseOzonePlatform --ozone-platform=wayland";
            icon = "discord-canary";
          })
        ];
        # installPhase = ''bash -c "$(curl https://raw.githubusercontent.com/fuwwy/Discord-Screenshare-Linux/main/scripts/install.sh -sSfL)"'';
      }
    )
  ];
}
