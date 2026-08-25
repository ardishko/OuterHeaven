{
  pkgs,
  lib,
  # config,
  ...
}:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        theme = "catppuccin-frappe-sky";
        package = lib.mkForce pkgs.kdePackages.sddm;
        wayland.enable = true;
      };
    };
    xserver = {
      displayManager = {
        lightdm.enable = false;
      };
    };
  };
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "frappe";
      accent = "sky";
      font = "Iosevka Nerd Font";
      fontSize = "15";
      loginBackground = true;
    })
  ];
}
