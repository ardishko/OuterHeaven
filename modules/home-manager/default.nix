{ hostname, ... }:
{
  imports = if (hostname == "jd") then [
    ./tui/nushell.nix
    ./packages/packages.nix
  ] else [
    ./gui
    ./other
    ./packages
    ./services
    ./tui
    #        ./schizofox.nix
    #           wtf raf
  ];
  home.stateVersion = "23.05";
}
