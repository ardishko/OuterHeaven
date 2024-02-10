{
  pkgs,
  inputs,
  lib,
  options,
  ...
}: {
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  environment.systemPackages = with pkgs; [
    bash
    gamescope
    lshw
    # (pkgs.writeScript."hyprlaunch") ''
    # #! /usr/bin/env nix-shell
    # #! nix-shell -i bash -p bash
    #
    # # Wayland Fix
    # export _JAVA_AWT_WM_NONREPARENTING=1
    # export XDG_CURRENT_DESKTOP=Hyprland
    # #export QT_QPA_PLATFORM=wayland;xcb
    # export WLR_NO_HARDWARE_CURSORS=1
    # #EGL_PLATFORM=wayland
    # # Theming
    #
    # export GTK_THEME=Catppuccin-Frappe-Compact-Sky-Dark
    # #export QT_QPA_PLATFORMTHEME=qt6ct;qt5ct
    # #export QT_QPA_PLATFORMTHEME=gtk
    #
    # # smth to do with mozilla, idk
    # export MOZ_ENABLE_WAYLAND=1
    # export RUST_BACKTRACE=1
    #
    # exec Hyprland
    # ''
  ];
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.steamgriddb.SGDBoop"
      "org.ryujinx.Ryujinx"
      "org.yuzu_emu.yuzu"
      "io.mrarm.mcpelauncher"
      "net.rpcs3.RPCS3"
      "net.pcsx2.PCSX2"
    ];
  };
}
