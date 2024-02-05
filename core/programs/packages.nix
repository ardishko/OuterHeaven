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
  ];
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.librumreader.librum"
      "com.steamgriddb.SGDBoop"
      "org.ryujinx.Ryujinx"
      "org.yuzu_emu.yuzu"
      "io.mrarm.mcpelauncher"
      "net.rpcs3.RPCS3"
      "net.pcsx2.PCSX2"
    ];
  };
}
