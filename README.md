# General philosophy

Everything is categorized under what they are managed under and the goal is to make this fully modular, so that anyone can take a module from my config and have it work on theirs.

Like for example, If something is handled inside of the core system config (or otherwise known as nixos configurations), it will be listed under `/core` or if it's managed with home-manager then it will be inside home-manager and so forth. (For context: the reason why It's not simply called "nixos" is because it sounds way cooler to call it the "core" system config.)

Think of it like how a dependency tree works/looks.

This configuration is made so that you can drag and drop your traditional NixOS configuration files generated on installation or through the files `sudo nixos-generate-config` generates over at `/etc/nixos` (this is what I'm going to generally try to keep it compatible with since it's the most consistent.) into `/core/device-specific/$YOUR_HOSTNAME` although I can't guarantee that this will work for every auto-generated config BUT I am working to keep it compatible.


(and as a sidenote, this configuration will be a multi-system configuration in the future but I will not do it in a convoluded way like most people do, it will be easy to remove and add a device from the configuration and it's for this reason that I want to make it as easy as possible to migrate from your automatically generated configuration to this configuration. Most updated configuration will be on my main machine since most my other devices don't really need a lot.)

# Versioning

The versioning would be largely inconsistent if I version every update since this is something I modify daily or at the very worst weekly BUT when there is a major change I will bump the number up from 2.0 -> 3.0 for example. I will update the current major version we're on when I release big updates for this config.

Current major version: `2.0` (release notes: https://github.com/ardishco-the-great/nixcfg/commit/74fb191b478100c5d9abf9ddecedc52e6b6fdec4 )

Next Major version: `3.0` (will be released when my configuration is a multi-system configuration like mentioned above.)

# Why?

I just wanted to share my config, that's all :P

# Some stuff isn't working, why?

I admit that I sometimes set up stuff in my config that I don't make use of all the time so if there is a problem I might not notice it myself so feel free to open an issue (No, really I don't mind at all. Do it. It helps me better my system too.)

# Things to note

There is a fix for Steam's gamescope at ``/core/program-specific/steam.nix`` which is essential if you want to use gamescope on NixOS (mostly due to a bug) but If you are not interested in that, then you can safely remove that part.

There are a bunch of overrides under home.package inside of packages.nix under /home-manager/programs, some containing version overrides and some containing desktop entry changes.

Some notable ones are:

- The Vesktop override that changes the program's icon to the regular Discord icon and changes the title from "Vesktop" to "Discord".
- The flameshot override that adds some `buildInputs`, `cmakeBuildFlags` and the version. This is because the current flameshot package in nixpkgs is pretty bad and doesn't even have the version that adds proper wayland support on flameshot. Only the latest commits currently have Wayland support so I will not be updating this override for a while until the next stable release which is when the proper, solid Wayland support is supposedly coming. They added the `-DUSE_WAYLAND_GRIM` and `-DUSE_WAYLAND_CLIPBOARD` build flags as per an issue I opened a small while ago. (https://github.com/flameshot-org/flameshot/issues/3012)
- Some formatting is a bit bad because I haven't gone over my old Nix code to overhaul them with a proper formatter or anything of that sort

## What is the pkgcustom folder about?

pkgcustom's name comes from my mind where everything is chaos and I name things the way I do because they sound cool.

Besides the name, the pkgcustom folder is for experimental packages I have generated with nix-init and/or packages I'm working on to submit to nixpkgs eventually and the "why" of this is because I suck at writing flakes, so I will keep doing this until I get better at writing flakes for programs and utilities I love.

And yeah, I think that's about it. feel free to send me PRs or issues or anything at all. Beware of my idiocy and have fun with my config.
