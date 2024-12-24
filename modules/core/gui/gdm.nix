{ pkgs, ... }:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-frappe";
        package = pkgs.kdePackages.sddm;
      };
    };
    xserver = {
      displayManager = {
        lightdm.enable = false;
      };
    };
  };
  environment.systemPackages = [(
    pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      font  = "Iosevka Nerd Font";
      fontSize = "15";
      # background = "${./wallpaper.png}";
      # loginBackground = false;
    }
  )];
}
