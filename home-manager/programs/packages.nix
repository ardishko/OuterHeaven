{ config, pkgs, self, user, inputs, ... }:
{
	# Define your packages here and everything related.
	home.packages = with pkgs; [

	# Define packages that derive from inputs

		inputs.hyprcontrib.packages.${pkgs.system}.hyprprop
		inputs.nh.packages.${pkgs.system}.default
		inputs.ags.packages.${pkgs.system}.default
 		#inputs.nixpkgs-stable.legacyPackages.x86_64-linux.davinci-resolve
	# Over	
		wget
		obsidian
		vscodium-fhs
		lutris
		steam-rom-manager
		bluez-tools
		fish
		neofetch
		swaynotificationcenter
		font-manager
		gnome-photos
		easyeffects
		swaybg
		swayosd
		obs-studio
		obsidian
		wlr-randr
		wlogout
		thefuck
		htop
		killall
		steamtinkerlaunch
		prismlauncher-qt5
		appimage-run
		cinnamon.nemo-fileroller
		gnome.file-roller
		nerdfonts
		webdav
		gamemode
		davfs2
		hollywood
		protonup-qt
		protonup-ng
		pavucontrol
		hyprpicker
		swappy
		eww-wayland
		transmission-gtk
		gtklock
		sway-contrib.grimshot
		libreoffice-fresh
		wineWowPackages.stable
		winetricks
		protontricks
		soundux
		catppuccin-kvantum
		libsForQt5.qt5ct
		qt6Packages.qt6ct
		themechanger
		piper
		thunderbird
		mangohud
		nix-init
		waydroid
		celluloid
		vlc
		rustdesk
		tartube-yt-dlp
		ffmpeg
		helvum
		virt-manager
		krita
		gimp-with-plugins
		droidcam
		lolcat
		protonvpn-gui
		schildichat-desktop
		vulkan-tools
		fastfetch
		android-tools
		scrcpy
		baobab
		alacritty
		r2modman
		python3Full
		gnupg
		mangohud
		firefox
		gzdoom
		wlprop
		mate.mate-polkit
		cinnamon.folder-color-switcher
		libsForQt5.qtstyleplugins
		apple-cursor
		ioquake3
		nvtop-amd
		wlsunset
		#grapejuice
		pipes-rs
		qalculate-gtk
		cargo
		distrobox
		wf-recorder
		clonehero
		scanmem
		cinnamon.nemo
		unzip
		bless
		handbrake
		mullvad-vpn
		monero-gui
		heroic-unwrapped
		bottles-unwrapped
		woeusb-ng
		ungoogled-chromium
		signal-desktop-beta
		emacs-nox
		qgnomeplatform-qt6
		qgnomeplatform
		gparted
		gnome-usage
		signal-desktop
		timeshift
		watershot
		gnome.gnome-clocks
		gnome.gnome-sound-recorder
		wev
		clamav
		lutgen
		docker
		nushell
		speedtest-cli
		grim
		wl-clipboard
		gh
# Overrides

	(pkgs.goverlay.overrideAttrs { # cock
	src = pkgs.fetchFromGitHub {
		owner = "benjamimgois";
		repo = "goverlay";
		rev = "0.9.1";
		sha256 = "sha256-jLnWdywS398qu6lU0RMZ1cC3KM9dH9uWizuJZa7gahE";
		};
	})

	(pkgs.flameshot.overrideAttrs {
	src = pkgs.fetchFromGitHub {
		owner = "flameshot-org";
		repo = "flameshot";
		rev = "fa29bcb4279b374ea7753fc4a514fd705499f7e7";
		sha256 = "sha256-XIquratzK4qW0Q1ZYI5X6HIrnx1kTTFxeYeR7hjrpjQ=";
		};
		cmakeFlags = [
				"-DUSE_WAYLAND_GRIM=True"
				"-DUSE_WAYLAND_CLIPBOARD=1"
		];
		buildInputs = with pkgs; [ libsForQt5.kguiaddons ];
	})

	# Custom desktop entries

      (pkgs.makeDesktopItem {
        name = "Roblox App (Real)";
        desktopName = "Roblox App (Real)";
        genericName = "Roblox application for running roblox experiences. Includes gamescope and mangohud.";
        categories = ["Network" "Game"];
        type = "Application";
        icon = "grapejuice-roblox-player";
        exec = "gamescope -W 1920 -H 1080 --force-grab-cursor --force-windows-fullscreen vinegar player";
        terminal = false;
      })

	# Below are some failed attempts at overriding versions of some programs. They are safe to delete.

	#(pkgs.gpu-screen-recorder-gtk.overrideAttrs {
	#  src = pkgs.fetchgit {
	#    url = "https://repo.dec05eba.com/gpu-screen-recorder-gtk";
	#    rev = "6ebe8fb2a9c838e076286d960b3ef3c9482433b3";
	#    sha256 = "sha256-6ELq07fZAwlJN6AJTMffQ69bGaQ2FGThPbamQRvxrK4=";
	#  };
	# })

#	(pkgs.gpu-screen-recorder.overrideAttrs {
#	  src = pkgs.fetchgit {
#	    url = "https://repo.dec05eba.com/gpu-screen-recorder";
#	    rev = "cd6105fe10aa0761f4b0bd107947c81b2a5a2cc9";
#	    sha256 = "sha256-ROjydeuV+TL8VXAC/LRWJWJgGica+O/xW3RcuMselRc";
#	  };
#	 })

# Custom packages

(callPackage ../pkgcustom/vesktop/vesktop.nix {})
(callPackage ../pkgcustom/vinegar {})

	];
	
	  # Declarative flatpak module
  services.flatpak = {
    enableModule = true;
    packages = [ "flathub:app/org.kde.index//stable" "flathub-beta:app/org.kde.kdenlive/x86_64/stable" ];
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
    };
    target-dir = "/home/vaporsnake/.local/share/flatpak";
  };
	
	imports = [
		inputs.flatpaks.homeManagerModules.default
	];
}