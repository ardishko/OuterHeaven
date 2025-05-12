{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        font = wezterm.font("Iosevka Nerd Font"),
        font_size = 13.0,
        enable_scroll_bar = true,
        color_scheme = "catppuccin-frappe",
      }
    '';
  };
}
