{ pkgs, inputs, ... }:
{
  services = {
    # greetd = {
    #   enable = true;
    #     settings = {
    #       default_session = {
    #         command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
    #         user = "greeter";
    #       };
    #     };
    #   };
    # enable mysql for uni stuff
    mysql = {
      enable = true;
      package = pkgs.mysql80;
    };
    openssh.enable = true;
    flatpak.enable = true;
    blueman.enable = true;
    davfs2.enable = true;
    webdav.enable = true;
    ratbagd.enable = true;
    gvfs.enable = true;
    openssh.allowSFTP = true;
    gnome.gnome-keyring.enable = true;
    mullvad-vpn.enable = true;
    gnome.sushi.enable = true;
    udev.enable = true;
    #tailscale.enable = true;
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "tr";
      xkbVariant = "";
      excludePackages = [pkgs.xterm];
      videoDrivers = ["amdgpu"];
      displayManager = {
        lightdm.enable = false;
        gdm.enable = true;
      };
      # desktopManager = {
      # };
    };
  };
}
