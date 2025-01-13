{
  pkgs,
  inputs,
  lib,
  hostname,
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
      cloudflared
    ]
    ++ (lib.lists.optionals (hostname == "Tanker") [
      steamdeck-firmware
      jupiter-dock-updater-bin
    ]);
  services.flatpak.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans  
    noto-fonts-emoji
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
