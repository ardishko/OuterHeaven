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
    $rosewater = rgb(f2d5cf)
    $rosewaterAlpha = f2d5cf

    $flamingo = rgb(eebebe)
    $flamingoAlpha = eebebe

    $pink = rgb(f4b8e4)
    $pinkAlpha = f4b8e4

    $mauve = rgb(ca9ee6)
    $mauveAlpha = ca9ee6

    $red = rgb(e78284)
    $redAlpha = e78284

    $maroon = rgb(ea999c)
    $maroonAlpha = ea999c

    $peach = rgb(ef9f76)
    $peachAlpha = ef9f76

    $yellow = rgb(e5c890)
    $yellowAlpha = e5c890

    $green = rgb(a6d189)
    $greenAlpha = a6d189

    $teal = rgb(81c8be)
    $tealAlpha = 81c8be

    $sky = rgb(99d1db)
    $skyAlpha = 99d1db

    $sapphire = rgb(85c1dc)
    $sapphireAlpha = 85c1dc

    $blue = rgb(8caaee)
    $blueAlpha = 8caaee

    $lavender = rgb(babbf1)
    $lavenderAlpha = babbf1

    $text = rgb(c6d0f5)
    $textAlpha = c6d0f5

    $subtext1 = rgb(b5bfe2)
    $subtext1Alpha = b5bfe2

    $subtext0 = rgb(a5adce)
    $subtext0Alpha = a5adce

    $overlay2 = rgb(949cbb)
    $overlay2Alpha = 949cbb

    $overlay1 = rgb(838ba7)
    $overlay1Alpha = 838ba7

    $overlay0 = rgb(737994)
    $overlay0Alpha = 737994

    $surface2 = rgb(626880)
    $surface2Alpha = 626880

    $surface1 = rgb(51576d)
    $surface1Alpha = 51576d

    $surface0 = rgb(414559)
    $surface0Alpha = 414559

    $base = rgb(303446)
    $baseAlpha = 303446

    $mantle = rgb(292c3c)
    $mantleAlpha = 292c3c

    $crust = rgb(232634)
    $crustAlpha = 232634
    $accent = $mauve
    $accentAlpha = $mauveAlpha
    $font = JetBrainsMono Nerd Font

    # GENERAL
    general {
      disable_loading_bar = true
      hide_cursor = true
    }

    # BACKGROUND
    background {
      monitor = ${primary-monitor}
      path = ${../../../assets/wallpapers/idolGoro.jpg}
      blur_passes = 0
      color = $base
    }

    # LAYOUT
    label {
      monitor = ${primary-monitor}
      text = Layout: $LAYOUT
      color = $text
      font_size = 25
      font_family = Iosevka Nerd Font
      position = 30, -30
      halign = left
      valign = top
    }

    # TIME
    label {
      monitor = ${primary-monitor}
      text = $TIME
      color = $text
      font_size = 90
      font_family = Iosevka Nerd Font
      position = -30, 0
      halign = right
      valign = top
    }

    # DATE
    label {
      monitor = ${primary-monitor}
      text = cmd[update:43200000] date +"%A, %d %B %Y"
      color = $text
      font_size = 24
      font_family = Iosevka Nerd Font
      position = -30, -150
      halign = right
      valign = top
    }

    # USER AVATAR
    image {
      monitor = ${primary-monitor}
      path = $HOME/.face
      size = 100
      border_color = $accent
      position = 0, 75
      halign = center
      valign = center
    }

    # INPUT FIELD
    input-field {
      monitor = ${primary-monitor}
      size = 300, 60
      outline_thickness = 4
      dots_size = 0.2
      dots_spacing = 0.2
      dots_center = true
      outer_color = $accent
      inner_color = $surface0
      font_color = Iosevka Nerd Font
      fade_on_empty = false
      placeholder_text = <span foreground="##$textAlpha"><i>󰌾  Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>
      hide_input = false
      check_color = $accent
      fail_color = $red
      fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
      capslock_color = $yellow
      position = 0, -47
      halign = center
      valign = center
    }
    # general {
    #     disable_loading_bar = false
    #     hide_cursor = false
    #     grace = 5
    #     no_fade_in = true
    # }
    #
    # background {
    #     monitor = ${primary-monitor}
    #     path = ${../../../assets/wallpapers/idolGoro.jpg}
    #     color = rgba(20, 20, 20, 0.9)
    #     blur_passes = 5 # 0 disables blurring
    #     blur_size = 1
    #     noise = 0.0117
    #     contrast = 0.8916
    #     brightness = 0.8172
    #     vibrancy = 0.1696
    #     vibrancy_darkness = 0.0
    # }
    # background {
    #     monitor = HDMI-A-1
    #     path = ${../../../assets/wallpapers/mark-of-sacrifice-vertical.png}
    #     color = rgba(20, 20, 20, 0.9)
    #     blur_passes = 5 # 0 disables blurring
    #     blur_size = 1
    #     noise = 0.0117
    #     contrast = 0.8916
    #     brightness = 0.8172
    #     vibrancy = 0.1696
    #     vibrancy_darkness = 0.0
    # }
    #
    # label {
    #     monitor = ${primary-monitor}
    #     text = $TIME
    #     color = rgba(166, 173, 200, 1.0)
    #     font_family = Iosevka Nerd Font
    #     font_size = 41
    #
    #     position = 0, -100
    #     halign = center
    #     valign = top
    # }
    #
    # label {
    #     monitor = ${primary-monitor}
    #     text = Got ya now, Kiryu-chan!
    #     color = rgba(166, 173, 200, 1.0)
    #     font_size = 21
    #     font_family = Iosevka Nerd Font
    #
    #     position = 0, 80
    #     halign = center
    #     valign = center
    #   }
    # label {
    #     monitor = HDMI-A-1
    #     text = PEOPLE'S DREAMS... HAVE NO END!!
    #     color = rgba(166, 173, 200, 1.0)
    #     font_size = 21
    #     font_family = Iosevka Nerd Font
    #
    #     position = 0, 80
    #     halign = center
    #     valign = center
    # }
    #
    # label {
    #     monitor = ${primary-monitor}
    #     text = ⏾ cmd[systemctl suspend]
    #     halign = left
    #     valign = top
    #     font_family = Iosevka Nerd Font
    #     font_size = 15
    # }
    #
    # input-field {
    #     monitor = ${primary-monitor}
    #     size = 200, 50
    #     outline_thickness = 3
    #     dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
    #     dots_spacing = 0.15 # Scale of dot's absolute size, 0.0 - 1.0
    #     outer_color = rgb(166, 173, 200)
    #     inner_color = rgb(37, 35, 44)
    #     font_color = rgb(166, 173, 200)
    #     fade_on_empty = false
    #     placeholder_text = <i> ... </i> # Text rendered in the input box when it's empty.
    #     hide_input = false
    #     position = 0, -20
    #     halign = center
    #     valign = center
    #   }
      '';
}
