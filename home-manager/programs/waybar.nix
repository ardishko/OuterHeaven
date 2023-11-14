{ pkgs, ... }:
{

# style.css
programs.waybar.enable = true;
xdg.configFile."waybar/style.css".text = ''

/** ********** Colors ********** **/
/**Catppuccin Frappe Colors**/

@define-color base   #303446;
@define-color mantle #292c3c;
@define-color crust  #232634;

@define-color text     #c6d0f5;
@define-color subtext0 #a5adce;
@define-color subtext1 #b5bfe2;

@define-color surface0 #414559;
@define-color surface1 #51576d;
@define-color surface2 #626880;

@define-color overlay0 #737994;
@define-color overlay1 #838ba7;
@define-color overlay2 #949cbb;

@define-color blue      #8caaee;
@define-color lavender  #babbf1;
@define-color sapphire  #85c1dc;
@define-color sky       #99d1db;
@define-color teal      #81c8be;
@define-color green     #a6d189;
@define-color yellow    #e5c890;
@define-color peach     #ef9f76;
@define-color maroon    #ea999c;
@define-color red       #e78284;
@define-color mauve     #ca9ee6;
@define-color pink      #f4b8e4;
@define-color flamingo  #eebebe;
@define-color rosewater #f2d5cf;

/** @import "frappe.css"; **/
/** ********** Fonts ********** **/
* {
    font-family: "Iosevka Nerd Font", archcraft, sans-serif;
    font-size: 13px;
}

/** ********** Waybar Window ********** **/
window#waybar {
    background-color: @background;
	color: @foreground;
    transition-property: background-color;
    transition-duration: .5s;
}

window#waybar.hidden {
    opacity: 0.5;
}

window#waybar.empty {
}

/** ********** Clock ********** **/
#clock {
    border-bottom: 2px solid @green;
}

/** ********** Sway ********** **/
#workspaces {
	background-color: @background-alt;
	color: @white;
	border-radius: 0px 12px 0px 0px;
	padding: 4px;
}

#workspaces button {
	color: @white;
	padding: 2px 6px;
}

#workspaces button:hover {
	background-color: @background;
	color: @white;
	border: 0px solid @background;
	border-radius: 12px;
	padding: 2px 6px;
}

#workspaces button.visible {
	background-image: linear-gradient(to right, @blue , @green);
}

#workspaces button.focused {
	background-image: linear-gradient(to right, @red , @magenta);
}

#workspaces button.urgent {
	background-image: linear-gradient(to right, @red , @yellow);
}

#workspaces button.persistent {
	background-image: linear-gradient(to right, @yellow , @magenta);
}

#workspaces button.visible,
#workspaces button.focused,
#workspaces button.urgent,
#workspaces button.persistent {
	color: @background;
	border-radius: 12px;
	padding: 2px 6px;
}

#workspaces button.current_output {
}

#workspaces button#sway-workspace-1 {
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
    margin-right: 0;
}

#mode {
	background-color: @magenta;
    font-weight: bold;
}

#window {
	background-color: @background-alt;
	color: @white;
}
window#waybar.empty #window {
	background-color: transparent;
}

/** ********** Tray ********** **/
#tray {
    border-bottom: 2px solid @red;
}
#tray > .passive {
    -gtk-icon-effect: dim;
}
#tray > .needs-attention {
    -gtk-icon-effect: highlight;
}
#tray > .active {
}

/** ********** MPD ********** **/
@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

#mpd {
	color: @white;
}

#mpd.disconnected {
	background-color: @red;
	color: @background;
    border-bottom: 0px solid @white;
}

#mpd.stopped {
	background-image: linear-gradient(to right, @red , @cyan);
	color: @background;
}

#mpd.playing {
    background: linear-gradient(90deg, @green 25%, @magenta 50%, @cyan 75%, @yellow 100%); 
    background-size: 300% 300%;
    animation: gradient 10s ease infinite;
    color: @background;
}

#mpd.paused {
    border-bottom: 2px solid @blue;
}

/** ********** Pulseaudio ********** **/
#pulseaudio {
    border-bottom: 2px solid @yellow;
}

#pulseaudio.bluetooth {
    border-bottom: 2px solid @yellow;
}
#pulseaudio.muted {
	background-color: @red;
	color: @background;
    border-bottom: 0px solid @white;
}

/** ********** Network ********** **/
#network {
    border-bottom: 2px solid @cyan;
}

#network.disconnected {
	background-color: @red;
	color: @background;
    border-bottom: 0px solid @white;
}
#network.disabled {
	background-color: @red;
	color: @background;
}
#network.linked {
}
#network.ethernet {
}
#network.wifi {
}

/** ********** Bluetooth ********** **/
#bluetooth {
    border-bottom: 2px solid @magenta;
}
#bluetooth.disabled{
	background-color: @red;
	color: @background;
}
#bluetooth.off{
	background-color: @red;
	color: @background;
    border-bottom: 0px solid @white;
}
#bluetooth.on{
}
#bluetooth.connected{
}
#bluetooth.discoverable{
}
#bluetooth.discovering{
}
#bluetooth.pairable{
}

/** ********** Workspace ********** **/
/*#workspaces
#workspaces button
#workspaces button.active
#workspaces button.urgent
#workspaces button.hidden */

/** ********** Custom ********** **/
#custom-menu, #custom-power, #custom-themes {
	color: @background;
	margin: 6px 0px;
	border-radius: 2px;
}

#custom-menu {
	background-color: @magenta;
	margin-left: 6px;
	padding: 2px 6px;
	font-size: 16px;
}

#custom-power {
	background-color: @red;
	margin-right: 6px;
	padding: 2px 8px;
	font-size: 20px;
}

#custom-themes {
	background-color: @selected;
	margin-right: 6px;
	padding: 2px 8px;
	font-size: 14px;
}

/** Common style **/ 
#battery,
#clock,
#mode,
#window,
#tray,
#mpd,
#pulseaudio,
#network,
#bluetooth {
    background-color: @background-alt;
	border-radius: 2px;
	margin: 6px 0px;
	padding: 2px 10px;
}
'';

# config
xdg.configFile."waybar/config".text = ''
{
    "include": "~/.config/waybar/modules",
    "name": "main-bar", 			// Waybar name
    "id": "main-bar", 				// Waybar id
    "layer": "", 				// Waybar at top layer
    "mode": "", 				// Display mode (dock|hide|invisible|overlay)
    "exclusive": true, 				// Request an exclusive zone from the compositor
    "passthrough": false, 			// Do not pass any pointer events to the window under the bar
    "position": "top", 			// Waybar position (top|bottom|left|right)
    "height": 45, 					// Waybar height (to be removed for auto height)
    "width": "", 					// Waybar width (empty for auto width)
    "spacing": 6, 					// Gaps between modules
    "margin": 0, 					// Space around the bar
    "margin-top": 0, 				// Space above the bar
    "margin-bottom": 0, 			// Space below the bar
    "margin-left": 0, 				// Space to the left of the bar
    "margin-right": 0, 				// Space to the right of the bar
    "fixed-center": true, 			// Center modules position
    "ipc": true, 					// Control waybar with `swaymsg bar` commands
    // Choose the order of the modules
    //"modules-left": ["custom/menu", "mpd", "custom/themes"],
    "modules-left": ["custom/menu", "hyprland/workspaces", "hyprland/language"],
    "modules-right": ["hyprland/window", "tray", "pulseaudio", "backlight", "bluetooth", "network", "battery", "clock", "custom/power"],
},
'';

# modules
xdg.configFile."waybar/modules".text = ''

{

	// waybar-bluetooth
    "bluetooth": {
        //"controller": "controller1",
        //"format-device-preference": "",
        "format": " {status}",
        "format-on": " {status}",
        "format-off": " {status}",
        "format-disabled": " {status}",
        "format-connected": " {device_alias}",
        "format-connected-battery": " {device_alias}, {device_battery_percentage}%",
        "tooltip": true,
        "tooltip-format": "{controller_alias}\t{controller_address}",
        "tooltip-format-connected": "{controller_alias}\t{controller_address}\n\n{device_enumerate}",
        "tooltip-format-enumerate-connected": "{device_alias}\t{device_address}",
        "on-click": "blueman-manager",
    },

	// waybar-clock
    "clock": {
		"interval": 60,
		"align": 0,
		"rotate": 0,
        "tooltip-format": "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>",
        "format": " {:%H:%M}",
        "format-alt": " {:%A | %b %d, %G}"
    },

	// waybar-custom
    "custom/menu": {
         "format": " ",
         "tooltip": false,
         "on-click": "anyrun",
         "on-click-right": "wvkbd-mobintl",
    },

    "custom/power": {
         "format": "襤",
         "tooltip": false,
         "on-click": "wlogout",
    },

	// waybar-mpd
    "mpd": {
        "interval": 1,
        "unknown-tag": "N/A",
        "format": "{stateIcon} {artist} - {title} | 祥 {elapsedTime:%M:%S}",
        "format-disconnected": " Disconnected",
        "format-paused": "{stateIcon} {artist} - {title}",
        "format-stopped": " Stopped",
        "state-icons": {
            "paused": "",
            "playing": ""
        },
        "tooltip-format": "MPD (connected)",
        "tooltip-format-disconnected": "MPD (disconnected)",
		// Commands to execute on events
        "on-click": "mpc toggle",
        "on-click-middle": "mpc prev",
        "on-click-right": "mpc next",
        "on-update": "",
        "on-scroll-up": "mpc seek +00:00:01",
        "on-scroll-down": "mpc seek -00:00:01",
        "smooth-scrolling-threshold": 1,
    },

	// waybar-network
    "network": {
		"interval": 5,
        //"interface": "wlan*", // (Optional) To force the use of this interface, set it for netspeed to work
        "format-wifi": " {essid}",
        "format-ethernet": " {ipaddr}/{cidr}",
        "format-linked": " {ifname} (No IP)",
        "format-disconnected": "睊 Disconnected",
        "format-disabled": "睊 Disabled",
        "format-alt": " {bandwidthUpBits} |  {bandwidthDownBits}",
        "tooltip-format": " {ifname} via {gwaddr}",
    },

	// waybar-pulseaudio
    "pulseaudio": {
        //"format": "{volume}% {icon} {format_source}",
        "format": "{icon} {volume}%",
        "format-muted": "  Mute",
        "format-bluetooth": " {volume}% {format_source}",
        "format-bluetooth-muted": " Mute",
        "format-source": " {volume}%",
        "format-source-muted": "",
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "scroll-step": 5.0,
		// Commands to execute on events
        "on-click": "pulsemixer --toggle-mute",
        "on-click-right": "pulsemixer --toggle-mute",
        "smooth-scrolling-threshold": 1,
    },

	// waybar-hyprland-workspaces
    "hyprland/workspaces": {
         "disable-scroll": false,
         "disable-click": false,
         "all-outputs": true,
         "format": "{}",
         },
        "smooth-scrolling-threshold": 1,
        "disable-scroll-wraparound": false,
        "enable-bar-scroll": true,
        "disable-markup": false,
        "current-only": false,
        "sort-by-number": false,
    },

	// waybar-tray
    "tray": {
        "icon-size": 16,
        "spacing": 10
    },

    // hyprland/language
    "hyprland/language": {
        "on-click": "wvkbd-mobintl",
        "on-click-right": "pkill -9 wvkbd-mobintl",
    }
'';

}