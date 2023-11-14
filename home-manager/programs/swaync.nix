{ pkgs, ... }:
{
    # config.json
    xdg.configFile."swaync/config.json".text = ''
{
  "$schema": "/etc/xdg/swaync/configSchema.json",
  "positionX": "right",
  "positionY": "top",
  "layer": "overlay",
  "control-center-layer": "top",
  "layer-shell": true,
  "cssPriority": "application",
  "control-center-margin-top": 0,
  "control-center-margin-bottom": 0,
  "control-center-margin-right": 0,
  "control-center-margin-left": 0,
  "notification-2fa-action": true,
  "notification-inline-replies": false,
  "notification-icon-size": 64,
  "notification-body-image-height": 100,
  "notification-body-image-width": 200,
  "timeout": 10,
  "timeout-low": 5,
  "timeout-critical": 0,
  "fit-to-screen": true,
  "control-center-width": 500,
  "control-center-height": 600,
  "notification-window-width": 500,
  "keyboard-shortcuts": true,
  "image-visibility": "when-available",
  "transition-time": 200,
  "hide-on-clear": false,
  "hide-on-action": true,
  "script-fail-notify": true,
  "scripts": {
    "example-script": {
      "exec": "echo 'Do something...'",
      "urgency": "Normal"
    },
    "example-action-script": {
      "exec": "echo 'Do something actionable!'",
      "urgency": "Normal",
      "run-on": "action"
    }
  },
  "notification-visibility": {
    "example-name": {
      "state": "muted",
      "urgency": "Low",
      "app-name": "Spotify"
    }
  },
  "widgets": [
    "inhibitors",
    "title",
    "dnd",
    "notifications"
  ],
  "widget-config": {
    "inhibitors": {
      "text": "Inhibitors",
      "button-text": "Clear All",
      "clear-all-button": true
    },
    "title": {
      "text": "Notifications",
      "clear-all-button": true,
      "button-text": "Clear All"
    },
    "dnd": {
      "text": "Do Not Disturb"
    },
    "label": {
      "max-lines": 5,
      "text": "Label Text"
    },
    "mpris": {
      "image-size": 96,
      "image-radius": 12
    }
  }
}
'';

# style.css
xdg.configFile."swaync/style.css".text = ''
/*
 * vim: ft=less
*/

@define-color cc-bg #252836;

@define-color noti-border-color #99d1db;
@define-color noti-bg #252836;
@define-color noti-bg-darker #252836;
@define-color noti-bg-hover #252836;
@define-color noti-bg-focus rgba(0, 0, 0, 0);
@define-color noti-close-bg #3c3836;
@define-color noti-close-bg-hover #cc241d;

@define-color text-color #99d1db;
@define-color text-color-disabled #282828;

@define-color bg-selected #99d1db;

@define-color dnd-bg #3c3836;
@define-color dnd-selected #99d1db;
@define-color dnd-dot #282828;

@define-color noti-button #282828;
@define-color noti-button-hover #3c3836;

@define-color sep-color transparent;

* {
  font-family: "Iosevka Nerd Font Mono", sans-serif;
  font-size: 20px;
}

.notification-row {
  outline: none;
}

.notification-row:focus,
.notification-row:hover {
  background: @noti-bg-focus;
}

.notification {
  border-radius: 5px;
  margin: 6px 12px;
  box-shadow: none;
  padding: 0;
}

.low,
.normal {
  background-color: @noti-border-color;
  padding: 4px 4px 4px 4px;
  border: none;
  border-radius: 10px;
}

.critical {
  background-color: #cc241d;
  padding: 4px 4px 4px 4px;
  border: none;
  border-radius: 10px;
}

.notification-content {
  background: transparent;
  padding: 10px;
  border-radius: 5px;
}

.close-button {
  background: @noti-close-bg;
  color: @text-color;
  text-shadow: none;
  padding: 0;
  border-radius: 100%;
  margin-top: 12px;
  margin-right: 16px;
  box-shadow: none;
  border: none;
  min-width: 24px;
  min-height: 24px;
}

.close-button:hover {
  box-shadow: none;
  background: @noti-close-bg-hover;
  transition: all 0.15s ease-in-out;
  border: none;
}

.notification-default-action {
  padding: 4px;
  margin: 0;
  box-shadow: none;
  background-color: @noti-bg;
  border: none;
  border-bottom: 1px solid @sep-color;
  color: @text-color;
  transition: all 0.15s ease-in-out;
}

.notification-action {
  border: none;
  padding: 4px;
  margin: 0;
  box-shadow: none;
  background-color: @noti-button;
  color: @text-color;
  transition: all 0.15s ease-in-out;
}

.notification-default-action:hover {
  -gtk-icon-effect: none;
  background: @noti-bg-hover;
}

.notification-action:hover {
  -gtk-icon-effect: none;
  background: @noti-button-hover;
}

.notification-default-action {
  border-radius: 8px;
}

/* When alternative actions are visible */
.notification-default-action:not(:only-child) {
  border-bottom-left-radius: 0px;
  border-bottom-right-radius: 0px;
}

.notification-action {
  border-radius: 0px;
  border-top: none;
  border-right: none;
}

/* add bottom border radius to eliminate clipping */
.notification-action:first-child {
  border-bottom-left-radius: 10px;
}

.notification-action:last-child {
  border-bottom-right-radius: 10px;
  border-right: 1px solid @noti-border-color;
}

.inline-reply {
  margin-top: 8px;
}
.inline-reply-entry {
  background: @noti-bg-darker;
  color: @text-color;
  caret-color: @text-color;
  border: 1px solid @noti-border-color;
  border-radius: 12px;
}
.inline-reply-button {
  margin-left: 4px;
  background: @noti-bg;
  border: 1px solid @noti-border-color;
  border-radius: 12px;
  color: @text-color;
}
.inline-reply-button:disabled {
  background: initial;
  color: @text-color-disabled;
  border: 1px solid transparent;
}
.inline-reply-button:hover {
  background: @noti-bg-hover;
}

.image {
}

.body-image {
  margin-top: 6px;
  background-color: white;
  border-radius: 12px;
}

.summary {
  font-size: 22px;
  font-weight: bold;
  background: transparent;
  color: @text-color;
  text-shadow: none;
}

.time {
  font-size: 16px;
  font-weight: bold;
  background: transparent;
  color: @text-color;
  text-shadow: none;
  margin-right: 18px;
}

.body {
  font-size: 18px;
  font-weight: normal;
  background: transparent;
  color: @text-color;
  text-shadow: none;
}

.control-center {
  background: @cc-bg;
  padding-bottom: 25px;
  padding-top: 5px;
  padding-left: 10px;
  padding-right: 9px;
}

.control-center-list {
  background: transparent;
}

.control-center-list-placeholder {
  opacity: 0.5;
}

.floating-notifications {
  background: transparent;
}

/* Window behind control center and on all other monitors */
.blank-window {
  background-color: transparent;
}

/*** Widgets ***/

/* Title widget */
.widget-title {
  margin: 8px;
  font-size: 1.5rem;
  font-weight: bold;
  color: @text-color;
}
.widget-title > button {
  font-size: initial;
  font-weight: bold;
  color: #282828;
  text-shadow: none;
  background-color: #99d1db;
  border: none;
  box-shadow: none;
  border-radius: 5px;
}
.widget-title > button:hover {
  background-color: #3c99aa;
}

/* DND widget */
.widget-dnd {
  margin: 8px;
  font-size: 1.1rem;
  color: @text-color;
}
.widget-dnd > switch {
  font-size: initial;
  border-radius: 100px;
  background: @dnd-bg;
  border: none;
  box-shadow: none;
}
.widget-dnd > switch:checked {
  background: @dnd-selected;
}
.widget-dnd > switch slider {
  background: @dnd-dot;
  border-radius: 100px;
}

/* Label widget */
.widget-label {
  margin: 8px;
}
.widget-label > label {
  font-size: 1.1rem;
}

/* Mpris widget */
.widget-mpris {
  /* The parent to all players */
}
.widget-mpris-player {
  padding: 8px;
  margin: 8px;
}
.widget-mpris-title {
  font-weight: bold;
  font-size: 1.25rem;
}
.widget-mpris-subtitle {
  font-size: 1.1rem;
}

/* Buttons widget */
.widget-buttons-grid {
  padding: 8px;
  margin: 8px;
  border-radius: 12px;
  background-color: @noti-bg;
}

.widget-buttons-grid>flowbox>flowboxchild>button{
  background: @noti-bg;
  border-radius: 12px;
}

.widget-buttons-grid>flowbox>flowboxchild>button:hover {
  background: @noti-bg-hover;
}

/* Menubar widget */
.widget-menubar>box>.menu-button-bar>button {
  border: none;
  background: transparent;
}

.AnyName {
  background-color: @noti-bg;
  padding: 8px;
  margin: 8px;
  border-radius: 10px;
}

.AnyName>button {
  background-color: transparent;
  border: none;
}

.AnyName>button:hover {
  background-color: @noti-bg-hover;
}

.topbar-buttons>button { /* Name defined in config after # */
  border: none;
  background: transparent;
}

/* Volume widget */

.widget-volume {
  background-color: @noti-bg;
  padding: 8px;
  margin: 8px;
  border-radius: 12px;
}

.widget-volume>box>button {
  background: transparent;
  border: none;
}

.per-app-volume {
  background-color: @noti-bg-alt;
  padding: 4px 8px 8px 8px;
  margin: 0px 8px 8px 8px;
  border-radius: 12px
}

/* Backlight widget */
.widget-backlight {
  background-color: @noti-bg;
  padding: 8px;
  margin: 8px;
  border-radius: 12px;
}

/* Title widget */
.widget-inhibitors {
  margin: 8px;
  font-size: 1.5rem;
}
.widget-inhibitors > button {
  font-size: initial;
  color: @text-color;
  text-shadow: none;
  background: @noti-bg;
  border: 1px solid @noti-border-color;
  box-shadow: none;
  border-radius: 12px;
}
.widget-inhibitors > button:hover {
  background: @noti-bg-hover;
}
'';

}