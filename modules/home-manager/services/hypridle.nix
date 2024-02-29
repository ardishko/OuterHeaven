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
      timeout = 10                             # in seconds
      on-timeout = notify-send "You are idle!" # command to run when timeout has passed
      on-resume = notify-send "Welcome back!"  # command to run when activity is detected after timeout has fired.
    }
    '';
}
