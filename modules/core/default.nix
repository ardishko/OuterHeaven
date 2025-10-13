{ hostname, ... }:
{
  imports =
    if (hostname == "jd" && "theseus") then
      [
        ./services/firewall.nix
        ./other/impermanence.nix
        ./services/openssh.nix
        ./tui/keymap.nix
        ./gui/hyprland.nix
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
