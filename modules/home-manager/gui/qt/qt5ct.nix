{ pkgs, ... }:
{
  home.packages = with pkgs; [ libsForQt5.qt5ct ];
  xdg.configFile."qt5ct/qt5ct.conf".text = ''
[Appearance]
color_scheme_path=${./Catppuccin-Frappe.conf}
custom_palette=true
icon_theme=Papirus-Dark
standard_dialogs=default
style=Breeze

[Fonts]
fixed="Iosevka Nerd Font,14,-1,5,57,1,0,0,0,0"
general="Iosevka Nerd Font,14,-1,5,57,0,0,0,0,0"

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
keyboard_scheme=2
menus_have_icons=true
show_shortcuts_in_context_menus=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3

[SettingsWindow]
geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\x1^\0\0\x2\xdc\0\0\x6\xa4\0\0\0\0\0\0\x1^\0\0\x2\xde\0\0\x4\x83\0\0\0\0\x2\0\0\0\n\0\0\0\0\0\0\0\x1^\0\0\x2\xdc\0\0\x6\xa4)

[Troubleshooting]
force_raster_widgets=1
ignored_applications=@Invalid()
'';
}
