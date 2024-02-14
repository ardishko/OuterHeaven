{
  # Polkit stuff
  security = {
    polkit = {
      enable = true;
      debug = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (action.id === "org.freedesktop.NetworkManager.settings.modify.system") {
            var name = polkit.spawn(["cat", "/proc/" + subject.pid + "/comm"]);
            if (name == "steam\n") { return polkit.Result.NO; }
          }
        })
      '';
    };
  };
}
