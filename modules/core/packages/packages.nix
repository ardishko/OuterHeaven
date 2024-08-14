{ pkgs
, inputs
, lib
, options
, hostname
, ...
}: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];
  environment.systemPackages = with pkgs; [
    bash
    gamescope
    lshw
    f3d
  ]
  ++ (lib.lists.optionals (hostname == "ShadowMoses") [
    davinci-resolve
    hello
  ])
  ++ (lib.lists.optionals (hostname == "Tanker") [
    steamdeck-firmware
    jupiter-dock-updater-bin
  ]);

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "sober";
        location = "https://sober.vinegarhq.org/repo/";
      }
    ];
    packages = [
      "${
        pkgs.fetchurl {
          url = "https://sober.vinegarhq.org/sober.flatpakref";
          hash = "sha256-VFRvboQ7IZwYDQvEcWimOuno7vIj+5EztOvxCHvwSN4="; 
        }
      }"
      "com.github.tchx84.Flatseal"
      "com.steamgriddb.SGDBoop"
      "io.mrarm.mcpelauncher"
      "camp.nook.nookdesktop"
      "org.freedesktop.Sdk/x86_64/23.08"
      "com.fightcade.Fightcade"
      "io.itch.itch"
      "io.github.lime3ds.Lime3DS"
    ];
    # update.auto = {
    #   enable = true;
    #   onCalendar = "daily";
    # };
  };
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
}
