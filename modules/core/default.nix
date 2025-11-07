{ hostname, ... }:
{
  imports =
    if (hostname == "jd" || hostname == "theseus") then
      [
        ./services/firewall.nix
        ./other/impermanence.nix
        ./other/mainUser.nix
        ./other/nix.nix
        ./other/i2c.nix
        ./services/openssh.nix
        ./tui/keymap.nix
        ./gui/hyprland.nix
        ./gui/opengl.nix
        ./boot
      ]
    else
      [
        ./boot
        ./gui
        ./other
        ./packages
        ./services
        ./tui
      ];
}
