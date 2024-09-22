{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    (inputs.vesktop.legacyPackages."x86_64-linux".vesktop.overrideAttrs {
      desktopItems = [
        (makeDesktopItem {
          name = "vesktop";
          desktopName = "Discord";
          exec = "mullvad-exclude vesktop --enable-features=VaapiIgnoreDriverChecks,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization,UseMultiPlaneFormatForHardwareVideo";
          icon = "discord";
          startupWMClass = "VencordDesktop";
          genericName = "Internet Messenger";
          keywords = [
            "discord"
            "vencord"
            "electron"
            "chat"
          ];
          categories = [
            "Network"
            "InstantMessaging"
            "Chat"
          ];
        })
      ];
    })
  ];
}
