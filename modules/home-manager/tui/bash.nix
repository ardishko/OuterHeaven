{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(${pkgs.pay-respects}/bin/pay-respects --alias)"
    '';
  };
}
