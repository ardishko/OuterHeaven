{ pkgs, inputs, ... }:
{
  services = {
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
