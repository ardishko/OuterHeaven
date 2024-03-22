{ inputs, pkgs, ... }:
# {
#   imports = [ inputs.hypridle.homeManagerModules.default ];
#   services = {
#     hypridle = {
#       enable = true;
#       lockCmd = "${inputs.hyprlock.packages.${pkgs.system}.hyprlock}/bin/hyprlock";
#     };
#   };
# }
{
  xdg.configFile."hypr/hypridle.conf".text = ''
    listener {
      timeout = 1000 # in seconds
      on-timeout = ${inputs.hyprlock.packages.${pkgs.system}.hyprlock}/bin/hyprlock # command to run when timeout has passed
    }
    listener {
      timeout = 11000
      on-timeout = systemctl suspend
    }
    '';
}
