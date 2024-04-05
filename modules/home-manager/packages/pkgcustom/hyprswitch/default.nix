{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, wrapGAppsHook4
, cairo
, gdk-pixbuf
, glib
, gtk4
, libadwaita
, pango
, gtk4-layer-shell
}:

rustPlatform.buildRustPackage rec {
  pname = "hyprswitch";
  version = "1.2.2";

  src = fetchFromGitHub {
    owner = "H3rmt";
    repo = "hyprswitch";
    rev = "v${version}";
    hash = "sha256-w1AkbI/hrW3gcIZ+Fydcde2Ob8zzBRlzJSlk03MrJr0=";
  };

  cargoHash = "sha256-GXDhWfqNsE1HHTnc2KqAIwxibZUA9V6HcnhzUWxHdr0=";

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook4
  ];

  buildInputs = [
    cairo
    gdk-pixbuf
    glib
    gtk4
    libadwaita
    pango
    gtk4-layer-shell
  ];

  meta = with lib; {
    description = "A CLI/GUI that allows switching between windows in Hyprland";
    homepage = "https://github.com/H3rmt/hyprswitch";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "hyprswitch";
  };
}
