{ hostname, ... }:
{
  imports =
    if (hostname == "jd" && "theseus") then
      [
        ./tui/zsh.nix
        ./packages/packages.nix
      ]
    else
      [
        ./gui
        ./other
        ./packages
        ./services
        ./tui
        #        ./schizofox.nix
        #           wtf raf
      ];
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
}
