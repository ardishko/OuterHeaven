{ hostname, ... }:
{
  imports = if (hostname == "jd") then [
    ./services/firewall.nix
    ./other/impermanence.nix
    ./services/openssh.nix
    ./tui/keymap.nix
    ./gui/hyprland.nix
    ./boot
  ] else [
    ./boot
    ./gui
    ./options
    ./other
    ./packages
    ./services
    ./tui
  ];
}
