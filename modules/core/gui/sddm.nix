{
  pkgs,
  lib,
  config,
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
      autoLogin = {
        enable = if (config.networking.hostName == "Tanker") then true else false;
        user = builtins.head (
          builtins.attrNames (lib.filterAttrs (n: u: u.isNormalUser) config.users.users)
        );
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
      background = "${../../../assets/wallpapers/idolGoro.jpg}";
      loginBackground = true;
    })
  ];
}
