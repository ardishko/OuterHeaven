{ hostname, ... }:
{
  imports =
    if (hostname == "jd" || hostname == "theseus") then
      [
        ./tui/zsh.nix
        ./packages/packages.nix
        ./other/nixpkgs.nix
      ]
    else
      [
        ./gui
        ./other
        ./packages
        ./services
        ./tui
        #           wtf raf
      ];
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
