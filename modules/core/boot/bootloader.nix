{ inputs, config, ... }:
let
  resolution = if (config.networking.hostName == "ShadowMoses") then "2560x1440" else if (config.networking.hostName == "BigShell") then "1920x1200" else if (config.networking.hostName == "Tanker") then "1280x800" else "1920x1080";
in
{
  imports = [ inputs.minegrub-theme.nixosModules.default ];
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        devices = [ "nodev" ];
        gfxmodeEfi = "${resolution}";
        minegrub-theme = {
          enable = true;
          splash = "Also try Ultrakill!";
          background = "background_options/1.8  - [Classic Minecraft].png";
          boot-options-count = 4;
        };
      };
      systemd-boot.enable = false;
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}
