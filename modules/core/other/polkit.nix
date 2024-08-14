{ pkgs, ... }:
{
  # Polkit stuff
  security = {
    polkit = {
      enable = true;
      extraConfig = ''
        /* Grant access to /dev/dri/card0 for gsr-kms-server */
        polkit.addRule(function(action, subject) {
          if (action.id == "org.freedesktop.policykit.exec" &&
              action.lookup("program") == "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server") {
            if (subject.local && subject.active && subject.isInGroup("video")) {
              return polkit.Result.YES;
            }
          }
        });
        polkit.addRule(function(action, subject) {
          if (action.id == "org.freedesktop.policykit.exec" &&
              action.lookup("program") == "${pkgs.gpu-screen-recorder-gtk}/bin/gsr-kms-server") {
            if (subject.local && subject.active && subject.isInGroup("video")) {
              return polkit.Result.YES;
            }
          }
        });
      '';
    };
  };
}
