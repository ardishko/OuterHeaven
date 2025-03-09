# Directory structure

```
OuterHeaven/
├──builders/    (currently unused, module for remote build machines to help speed up rebuild time)
├──images/      (images referenced in my configuration such as wallpapers)
├───machines/          (machine specific configuration)
│   ├───ShadowMoses/         [Main Desktop]
│   ├───Tanker/            [My Steam Deck running NixOS]
│   ├───BigShell/           [My laptop, a Lenovo IdeaPad Flex 5 16ALC7]
│   └───jd/           [Another laptop, that I use as my server] (not an omnipotent AI)
├───modules/        (modules, all of which are machine-agnostic)
│   ├───core/         [modules managed with NixOS options and flake provided modules]
│   └───home-manager/        [modules managed with home-manager options and flake provided modules]
├───server/         [modules used for my hosted services on my server]
├───flake.nix       (my flake containing my inputs, outputs and 2 custom variables for each machine.)
└───flake.lock      (the flake lock, which controls version locks for each input.)
```

# General philosophy

The general philosophy is this configuration is simplicity and modularity.
Mostly so people I tell about NixOS can look at my configuration and understand
it.

# How 2 Install?

First, partition your drives with disko with the following commands

```console
sudo nix --extra-experimental-features 'nix-command flakes' run github:nix-community/disko -- --mode zap_create_mount --flake github:raidenovich/OuterHeaven
```

(Or preferably use the minimal install, which has the same disko file anyways)

Secondly, run the `nixos-install` command.

```console
sudo nixos-install --flake github:raidenovich/OuterHeaven
```

My personal advice is to clone the git repo and not remotely build as sometimes
it can disconnect from your wifi network while building. (Don't ask me why, I
don't know)

# What to do post-install? (note for self)

(In order)

1 - Import sops keys

2 - Create a user
[password with sops](https://github.com/Mic92/sops-nix?tab=readme-ov-file#setting-a-users-password)

3 - Create a root
[password with sops](https://github.com/Mic92/sops-nix?tab=readme-ov-file#setting-a-users-password)

4 - Refer to this page for KDE theming related stuff. It really does not look
like there are any declarative options for this so we have to do it imperatively
like
[this](https://github.com/shalva97/kde-configuration-files?tab=readme-ov-file#changing-appearance)
(disgusting, I know.)

And with that, you'll get this config on a brand new computer! Hopefully.

# Versioning

The versioning would be largely inconsistent if I version every update since
this is something I modify daily or at the very worst weekly BUT when there is a
major change I will bump the number up from 2.0 -> 3.0 for example. I will
update the current major version we're on when I release big updates for this
config such as changes to config structre.

Current major version: `4.0`
<br> Next Major version: `5.0` (will be released when my configuration is a
multi-system configuration like mentioned above.) (No plans for this yet.)

# Why?

I just wanted to share my config, that's all :P

# Some stuff isn't working, why?

I admit that I sometimes set up stuff in my config that I don't make use of all
the time so if there is a problem I might not notice it myself so feel free to
open an issue (No, really I don't mind at all. Do it. It helps me better my
system too.)

Additionally, there are unused modules that are usually in a folder called
`unused/` in their respective directories, which may or may not work, though
usually they should because they did in the past.

## Heirarchy of fixes/workarounds applied

```
├──modules/core/gui/steam.nix    (gamescope workaround)
├──modules/home-manager/gui/flameshot.nix      (flameshot wayland fix)
├──modules/home-manager/gui/vesktop.nix        (vesktop override)
├──modules/home-manager/packages/packages.nix   (packages module)
└──modules/home-manager/packages/pkgcustom/     (pkgcustom)
```

## Info about workaround/fixes applied

**See paranthesis' above for related modules and their directories.**

<details>
<summary><b><font size="+3">gamescope workaround</font></b></summary>

The override used here for Gamescope running through steam on NixOS (yes, **very
specifically gamescope running through Steam on NixOS**) does not bring up the
gamescope window because gamescope looks for certain libraries in the provided
FHS environment and it can't find them in said FHS environment, therefore making
this workaround necessary.

</details>

<details>
<summary><b><font size="+3">flameshot wayland fix</font></b></summary>

The overrides used here make it so that flameshot is compiled with the
appropriate cmake flags so that it works on Wayland and locks the version to a
certain commit known to work with Wayland.
(https://github.com/flameshot-org/flameshot/issues/3012)

</details>

<details>
<summary><b><font size="+3">vesktop override</font></b></summary>

The overrides used here removes Vencord related branding and replaces the icons
and name with regular Discord's and adds launch flags that help with screen
sharing on Wayland.

</details>

<details>
<summary><b><font size="+3">packages module</font></b></summary>

This home manager managed module contains packages I manage under home-manager,
alongside some overrides and override templates that I plan to reuse later.

</details>

<details>
<summary><b><font size="+3">pkgcustom</font></b></summary>

packages that I plan to submit to nixpkgs in the future, some of which are
referenced in packages.nix but mostly not. The name is **pkgcustom** because it
sounded cool in my head.

</details>

## Plans

- [ ] non-nixlang configurations in their own folder (so that the used languages
      percentage can be accurate)
- [x] Multi-system configuration
- [x] Jovian NixOS setup
- [x] Impermanence
- [x] Disko (for each machine)

...And more! (There are some things that are too insignificant for me to
permanently add to this plans section)

## Cool people

people I was so gracious as to ~~steal~~ take inspiration from :)

https://git.notashelf.dev/NotAShelf/nyx (I didn't actually take anything from
notashelf's config, but felt like adding them anyway because funny.)
<br> https://git.jacekpoz.pl/jacekpoz/niksos (I literally stole the entire
README.md format from this guy)
<br> https://git.outfoxxed.me/outfoxxed/nixnew (There are way too many things to
say about this one)
<br> https://github.com/kinzoku-dev/nebula (this person steals from me) (I'm
flattered by it)
<br> https://github.com/IogaMaster/dotfiles (added here for losing their mind
and trying to help me set up my minecraft server AND making awesome nix videos)
<br> https://github.com/vimjoyer/nixconf (added for being a cool guy and making
super duper awesome nix videos)
<br> https://github.com/iynaix/dotfiles (added for being a nix wizard.)

Special thanks to:

Anyone and everyone who has starred this config. It makes me super happy to know
that my code helps some people! :^)
