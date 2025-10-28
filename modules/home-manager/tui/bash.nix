{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(${pkgs.thefuck}/bin/thefuck --alias)"
    '';
  };
}
