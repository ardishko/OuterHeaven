{ pkgs, ... }:
{
  home.packages = with pkgs; [
    flameshot
  ];
  xdg.configFile."flameshot/flameshot.ini".text = ''
    [General]
    contrastOpacity=188
    useGrimAdapter=true
  '';
}
