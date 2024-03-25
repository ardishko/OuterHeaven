{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ virt-manager ];
  xdg.desktopEntries = {
    "virt-manager" = lib.mkForce {
      name = "Virtual Machine Manager";
      type = "Application";
      icon = "virt-manager";
      terminal = false;
      exec = "mullvad-exclude virt-manager";
    };
  };
}
