{
  pkgs,
  lib,
  config,
  ...
}:
{
  environment.systemPackages =
    with pkgs;
    [
      bash
      gamescope
      lshw
      f3d
    ]
    ++ (lib.lists.optionals (config.networking.hostName == "ShadowMoses") [
      # davinci-resolve
    ])
    ++ (lib.lists.optionals (config.networking.hostName == "Tanker") [
      steamdeck-firmware
      jupiter-dock-updater-bin
    ]);
  services.flatpak.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
  ];
}
