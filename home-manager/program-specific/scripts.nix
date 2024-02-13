{
  let hyprland-init = writeShellScriptBin "hyprland-init" ''
      # script contents
  ''; in {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "${hyprland-init}/bin/hyprland-init"
      ];
    }; 
  };
}