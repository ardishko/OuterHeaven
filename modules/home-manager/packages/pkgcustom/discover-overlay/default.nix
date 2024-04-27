{
  lib,
  python3Packages,
  fetchFromGitHub,
  wrapGAppsHook,
  gobject-introspection,
  gtk-layer-shell,
}:
python3Packages.buildPythonApplication rec {
  pname = "discover";
  version = "0.7.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "trigg";
    repo = "Discover";
    rev = "v${version}";
    hash = "sha256-a9IPNy5i088rltQ9LYD+DgJ/1/wckQ2E5Bzg62t95yU=";
  };

  nativeBuildInputs = [
    wrapGAppsHook
    gobject-introspection
  ];

  propagatedBuildInputs = [
    gtk-layer-shell
    python3Packages.pillow
    python3Packages.pygobject3
    python3Packages.pygobject3
    python3Packages.pyxdg
    python3Packages.requests
    python3Packages.setuptools
    python3Packages.websocket-client
    python3Packages.xlib
    python3Packages.pulsectl-asyncio
  ];

  meta = with lib; {
    description = "Yet another discord overlay for linux";
    homepage = "https://github.com/trigg/Discover";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [];
    mainProgram = "discover";
  };
}
