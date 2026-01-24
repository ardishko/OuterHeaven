{
  description = "me when the flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcontrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };
    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs"; # override this repo's nixpkgs snapshot
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
    };
    anime-games = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    shadower = {
      url = "github:n3oney/shadower";
    };
    wayfreeze = {
      url = "github:jappie3/wayfreeze";
    };
    watershot = {
      url = "github:Kirottu/watershot";
    };
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:ardishko/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    tag-studio = {
      url = "github:TagStudioDev/TagStudio";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dolphin-emu = {
      url = "github:MatthewCroughan/dolphin-emu-nix";
    };
    flux = {
      url = "github:IogaMaster/flux";
    };
    nvf = {
      url = "github:notashelf/nvf";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:KaylorBen/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minegrub-theme = {
      url = "github:Lxtharia/minegrub-theme";
    };
    catpuccin-cursors = {
      url = "github:catppuccin/cursors";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hytale-launcher = {
      url = "github:JPyke3/hytale-launcher-nix";
    };
  };
  outputs =
    inputs@{
      nixpkgs,
      unstable,
      disko,
      ...
    }:
    {
      nixosConfigurations = {
        ShadowMoses = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs =
            let
              username = "vaporsnake";
              hostname = "ShadowMoses";
            in
            {
              inherit inputs username hostname;
            };
          modules = [
            ./machines/ShadowMoses
            ./modules
            ./secrets
            disko.nixosModules.disko
            (import ./disko.nix {
              device = "/dev/nvme0n1";
              hostname = "ShadowMoses";
            })
          ];
        };
        Tanker = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs =
            let
              username = "raiden";
              hostname = "Tanker";
            in
            {
              inherit inputs username hostname;
            };
          modules = [
            ./machines/Tanker
            ./modules
            ./secrets
            disko.nixosModules.disko
            (import ./disko.nix {
              device = "/dev/nvme0n1";
              hostname = "Tanker";
            })
          ];
        };
        BigShell = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs =
            let
              username = "liquid";
              hostname = "BigShell";
            in
            {
              inherit inputs username hostname;
            };
          modules = [
            ./machines/BigShell
            ./modules
            ./secrets
            disko.nixosModules.disko
            (import ./disko.nix {
              device = "/dev/nvme0n1";
              hostname = "BigShell";
            })
          ];
        };
        jd = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs =
            let
              username = "snake";
              hostname = "jd";
            in
            {
              inherit inputs username hostname;
            };
          modules = [
            ./machines/jd
            ./server
            ./modules
            ./secrets
            disko.nixosModules.disko
            (import ./disko.nix {
              device = "/dev/nvme0n1";
              hostname = "jd";
            })
          ];
        };
        theseus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs =
            let
              username = "snake";
              hostname = "theseus";
            in
            {
              inherit inputs username hostname;
            };
          modules = [
            ./machines/theseus
            ./server
            ./modules
            ./secrets
            disko.nixosModules.disko
            (import ./disko.nix {
              memcard = "/dev/mmcblk0";
              hdd1 = "/dev/sda";
              hostname = "theseus";
            })
          ];
        };
        Kamurocho = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs =
            let
              username = "majima";
              hostname = "Kamurocho";
            in
            {
              inherit inputs username hostname;
            };
          modules = [
            ./machines/Kamurocho
            ./modules
            ./secrets
            disko.nixosModules.disko
            (import ./disko.nix {
              device = "/dev/nvme2n1";
              hostname = "Kamurocho";
            })
          ];
        };
      };
    };
}
