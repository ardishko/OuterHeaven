{
  pkgs,
  inputs,
  lib,
  options,
  hostname,
  ...
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
    packages = [
      "com.github.tchx84.Flatseal"
      "com.steamgriddb.SGDBoop"
      "io.mrarm.mcpelauncher"
      "camp.nook.nookdesktop"
      "org.freedesktop.Sdk/x86_64/23.08"
      "com.fightcade.Fightcade"
      "io.itch.itch"
      "io.github.lime3ds.Lime3DS"
    ];
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
