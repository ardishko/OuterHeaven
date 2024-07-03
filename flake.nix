{
  description = "me when the flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcontrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    xdg-desktop-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "hyprland";
    };
    hy3 = {
      url = "github:outfoxxed/hy3";
      # or "github:outfoxxed/hy3?ref=hl{version}" for a release version of hyprland
      inputs.hyprland.follows = "hyprland";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.1.0";
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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anime-games = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs.nixpkgs.follows = "hyprland";
    };
    pyprland = {
      url = "github:hyprland-community/pyprland";
    };
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
    };
    shadower = {
      url = "github:n3oney/shadower";
    };
    vesktop.url = "github:NixOS/nixpkgs/755b915a158c9d588f08e9b08da9f7f3422070cc";
    wayfreeze = {
      url = "github:jappie3/wayfreeze";
    };
    watershot = {
      url = "github:Kirottu/watershot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
    };
    disko = {
      url = "github:raidenovich/disko";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    tag-studio = {
      url = "github:TagStudioDev/TagStudio";
    };
    ags = {
      url = "github:Aylur/ags";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    disko,
    ...
  }: {
    nixosConfigurations.ShadowMoses = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "vaporsnake"; hostname = "ShadowMoses"; in {inherit inputs username hostname;};
      modules = [
        ./machines/ShadowMoses
        ./modules
        ./secrets
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
        (import ./disko.nix {
          device = "/dev/nvme0n1";
          hostname = "ShadowMoses";
        })
      ];
    };
    nixosConfigurations.Tanker = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "raiden"; hostname = "Tanker"; in {inherit inputs username hostname;};
      modules = [
        ./machines/Tanker
        ./modules
        ./secrets
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
        (import ./disko.nix {
          device = "/dev/nvme0n1";
          hostname = "Tanker";
        })
      ];
    };
    nixosConfigurations.BigShell = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "liquid"; hostname = "BigShell"; in {inherit inputs username hostname;};
      modules = [
        ./machines/BigShell
        ./modules
        ./secrets
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
        (import ./disko.nix {
          device = "/dev/nvme0n1";
          hostname = "BigShell";
        })
      ];
    };
    nixosConfigurations.jd = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "theabyssbar"; hostname = "jd"; in {inherit inputs username hostname;};
      modules = [
        ./machines/jd
        ./modules/self-host
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
