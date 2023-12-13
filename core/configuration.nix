# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
      #efiSysMountPoint = "boot/efi";
    };
  };
  #boot.loader.grub = {
  #  enable = true;
  #  devices = ["nodev"];
  #  efiSupport = true;
  #  useOSProber = true;
  #  theme =
  #    pkgs.fetchFromGitHub {
  #      owner = "catppuccin";
  #      repo = "grub";
  #      rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
  #      sha256 = "/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
  #    }
  #    + "/src/catppuccin-frappe-grub-theme";
  #};

  networking.hostName = "ShadowMoses"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  # Enable the WMs and programs.
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd /home/vaporsnake/scripts/hyprlaunch";
        user = "greeter";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
  programs = {
    dconf.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };
  services = {
    #tailscale.enable = true;
    flatpak.enable = true;
    blueman.enable = true;
    davfs2.enable = true;
    webdav.enable = true;
    ratbagd.enable = true;
    gvfs.enable = true;
    openssh.allowSFTP = true;
    gnome.gnome-keyring.enable = true;
    mullvad-vpn.enable = true;
    gnome.sushi.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "tr";
      xkbVariant = "";
      excludePackages = [pkgs.xterm];
      videoDrivers = ["amdgpu"];
    };
  };
  systemd = {
    services.NetworkManager-wait-online.enable = false;
  };
  hardware = {
    # Enable OpenGL and Vulkan stuff
    opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
    bluetooth.enable = true;
  };

  virtualisation = {
    libvirtd.enable = true;
    waydroid.enable = true;
    podman.enable = true;
  };
  # Polkit stuff
  security = {
    pam.services = {
      swaylock.text = "auth include login";
    };
    polkit = {
      enable = true;
      debug = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (action.id === "org.freedesktop.NetworkManager.settings.modify.system") {
            var name = polkit.spawn(["cat", "/proc/" + subject.pid + "/comm"]);
            if (name == "steam\n") { return polkit.Result.NO; }
          }
        })
      '';
    };
  };

  # Configure keymap in X11

  # Configure console keymap
  console.keyMap = "trq";

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vaporsnake = {
    isNormalUser = true;
    description = "vaporsnake";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
    ];
    shell = pkgs.nushell;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "python-2.7.18.7"
      ];
    };
  };
  # Enable flakes
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    builders-use-substitutes = true;
    # substituters to use
    substituters = [
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
    ];

    trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    bash
    gamescope
    lshw
  ];
  #};
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerdfonts
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
  # boot.kernelParams = [ loglevel = 1 ]
  boot.consoleLogLevel = 1;
  boot.supportedFilesystems = ["ntfs"];
  boot.kernelParams = ["split_lock_detect=off"];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  imports = [
    inputs.home-manager.nixosModules.home-manager
    #    ../builders
  ];
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  # Some home manager stuff
  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    useGlobalPkgs = false;
    useUserPackages = true;
    users = {
      # Import your home-manager configuration
      vaporsnake = import ../home-manager;
    };
  };
}
