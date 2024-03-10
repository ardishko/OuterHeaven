{ pkgs, ... }:
{
 home.packages = with pkgs; [
    (pkgs.vesktop.overrideAttrs {
      desktopItems = [
        (makeDesktopItem {
          name = "vesktop";
          desktopName = "Vesktop";
          exec = "mullvad-exclude vesktop --enable-gpu --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
          icon = "discord";
          startupWMClass = "VencordDesktop";
          genericName = "Internet Messenger";
          keywords = ["discord" "vencord" "electron" "chat"];
          categories = ["Network" "InstantMessaging" "Chat"];
        })
      ];
    })
 ];
}
