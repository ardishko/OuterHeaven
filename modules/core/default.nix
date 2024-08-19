{ hostname, ... }:
{
  imports = if (hostname == "jd") then [
    ./services/firewall.nix
    ./other/impermanence.nix
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
