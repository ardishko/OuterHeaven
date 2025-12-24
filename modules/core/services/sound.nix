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
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
