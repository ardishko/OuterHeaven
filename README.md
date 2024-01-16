# General philosophy

Mostly, everything is categorized under what they are managed under.

Like for example, If something is handled inside of the core system config, it will be listed under /core or if it's managed with home-manager then it will be inside home-manager and so forth.

Think of it like how a dependency tree works.

I mostly base my configuration on traditional NixOS configuration

# Why?

I just wanted to share my config, that's all :P

# X isn't working, why?

I admit that I sometimes set up stuff in my config that I don't make use of all the time so if there is a problem I might not notice it myself so feel free to open an issue (No, really I don't mind at all. Do it.)

# Things to note

There is a fix for Steam's gamescope under /core/configuration.nix which is essential if you want to use gamescope on NixOS what-so-ever but If you are not interested in that, then you can safely remove it.

There are a bunch of overrides under home.package inside of packages.nix under /home-manager/programs, some containing version overrides and some containing desktop entry changes.

Some notable ones are:

- The Vesktop override that changes the program's icon to the regular Discord icon and changes the title from "Vesktop" to "Discord".
- The flameshot override that adds some `buildInputs`, `cmakeBuildFlags` and the version. This is because the current flameshot package in nixpkgs is pretty bad and doesn't even have the version that adds proper wayland support on flameshot. Only the latest commits currently have Wayland support so I will not be updating this override for a while until the next stable release which is when the proper, solid Wayland support is supposedly coming. They added the `-DUSE_WAYLAND_GRIM` and `-DUSE_WAYLAND_CLIPBOARD` build flags as per an issue I opened a small while ago. (https://github.com/flameshot-org/flameshot/issues/3012)
- Some formatting is a bit bad because I haven't gone over my old Nix code to overhaul them with a proper formatter or anything of that sort

## What is the pkgcustom folder about?

pkgcustom's name comes from my mind where everything is chaos and I name things the way I do because they sound cool.

Besides the name, the pkgcustom folder is for experimental packages I have generated with nix-init and/or packages I'm working on to submit to nixpkgs eventually and the "why" of this is because I suck at writing flakes, so I will keep doing this until I get better at writing flakes for programs and utilities I love.

And yeah, I think that's about it. feel free to send me PRs or issues or anything at all. Beware of my idiocy and have fun with my config.
