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

        window_frame = {
          active_titlebar_bg = '#292c3c',
          inactive_titlebar_bg = '#292c3c',
        },

        colors = {
          tab_bar = {
            background = '#303446',

            new_tab = {
              bg_color = '#414559',
              fg_color = '#c6d0f5',
            },
            new_tab_hover = {
              bg_color = '#51576d',
              fg_color = '#c6d0f5',
            },

            active_tab = {
              bg_color = '#8caaee',
              fg_color = '#303446',
            },
            inactive_tab = {
              bg_color = '#414559',
              fg_color = '#c6d0f5',
            },
            inactive_tab_hover = {
              bg_color = '#51576d',
              fg_color = '#c6d0f5',
            },
          },
        },
      }
    '';
  };
}
