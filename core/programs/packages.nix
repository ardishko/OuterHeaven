{
  pkgs,
  inputs,
  lib,
  options,
  ...
}: {
  services.flatpak = {
    enable = true;
    packages = [
      "org.kde.Platform"
      "org.freedesktop.Platform.GL.default"
      "org.kde.Platform.Locale"
      "org.freedesktop.Platform.openh264"
      "org.gnome.Platform"
      "org.freedesktop.Platform.Compat.i386"
      "org.freedesktop.Platform"
      "com.github.tchx84.Flatseal"
      "com.librumreader.librum"
      "com.steamgriddb.SGDBoop"
      "org.ryujinx.Ryujinx"
      "org.yuzu_emu.yuzu"
      "org.freedesktop.Platform.ffmpeg-full"
      "io.mrarm.mcpelauncher"
      "net.rpcs3.RPCS3"
    ];
  };
}
