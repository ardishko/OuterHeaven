{ inputs, pkgs, osConfig, ... }:
let
  primary-monitor = if (osConfig.networking.hostName == "ShadowMoses") then "DP-2"
  else
    if (osConfig.networking.hostName == "BigShell") then "eDP-1" 
  else
    if (osConfig.networking.hostName == "Tanker") then "eDP-1" 
  else
    "HDMI-A-1";
in  
{
  home.packages = [ inputs.hyprlock.packages.${pkgs.system}.hyprlock ];
  xdg.configFile."hypr/hyprlock.conf".text = ''
    general {
        disable_loading_bar = false
        hide_cursor = false
        grace = 5
        no_fade_in = true
    }

    background {
        monitor = ${primary-monitor}
        path = ${../../../assets/wallpapers/idolGoro.jpg}
        color = rgba(20, 20, 20, 0.9)
        blur_passes = 5 # 0 disables blurring
        blur_size = 1
        noise = 0.0117
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
    }
    background {
        monitor = HDMI-A-1
        path = ${../../../assets/wallpapers/mark-of-sacrifice-vertical.png}
        color = rgba(20, 20, 20, 0.9)
        blur_passes = 5 # 0 disables blurring
        blur_size = 1
        noise = 0.0117
        contrast = 0.8916
        brightness = 0.8172
        vibrancy = 0.1696
        vibrancy_darkness = 0.0
    }

    label {
        monitor = ${primary-monitor}
        text = $TIME
        color = rgba(166, 173, 200, 1.0)
        font_family = Iosevka Nerd Font
        font_size = 41

        position = 0, -100
        halign = center
        valign = top
    }

    label {
        monitor = ${primary-monitor}
        text = Got ya now, Kiryu-chan!
        color = rgba(166, 173, 200, 1.0)
        font_size = 21
        font_family = Iosevka Nerd Font

        position = 0, 80
        halign = center
        valign = center
      }
    label {
        monitor = HDMI-A-1
        text = PEOPLE'S DREAMS... HAVE NO END!!
        color = rgba(166, 173, 200, 1.0)
        font_size = 21
        font_family = Iosevka Nerd Font

        position = 0, 80
        halign = center
        valign = center
    }

    label {
        monitor = ${primary-monitor}
        text = ⏾ cmd[systemctl suspend]
        halign = left
        valign = top
        font_family = Iosevka Nerd Font
        font_size = 15
    }

    input-field {
        monitor = ${primary-monitor}
        size = 200, 50
        outline_thickness = 3
        dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.15 # Scale of dot's absolute size, 0.0 - 1.0
        outer_color = rgb(166, 173, 200)
        inner_color = rgb(37, 35, 44)
        font_color = rgb(166, 173, 200)
        fade_on_empty = false
        placeholder_text = <i> ... </i> # Text rendered in the input box when it's empty.
        hide_input = false
        position = 0, -20
        halign = center
        valign = center
      }
      '';
}
