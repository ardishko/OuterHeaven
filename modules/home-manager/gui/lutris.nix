{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.lutris.overrideAttrs { buildInputs = with pkgs; [ libxdamage ]; })
  ];
}
