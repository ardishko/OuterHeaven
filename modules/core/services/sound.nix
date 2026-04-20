{
  pkgs,
  ...
}:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber = {
      enable = true;
      extraConfig = {
        disable-autoswitch = {
          "wireplumber.settings" = {
            "bluetooth.autoswitch-to-headset-profile" = "false";
          };
        };
      };
    };
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraLv2Packages = with pkgs; [
      lsp-plugins
      rnnoise-plugin
    ];
    extraConfig.pipewire."92-fix-clock-drift" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [ 48000 ];
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 1024;
        "default.clock.max-quantum" = 1024;
      };
    };
  };
}
