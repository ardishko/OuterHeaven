{ lib
, python3
, fetchFromGitHub
}:

python3.pkgs.buildPythonApplication rec {
pname = "discover";
version = "0.6.9";
pyproject = true;

src = fetchFromGitHub {
  owner = "trigg";
  repo = "Discover";
  rev = "v${version}";
  hash = "sha256-9RKxViuhSkbVmNzAIuqxnTupfqwxeJl9BCmOR2c2u6c=";
};

nativeBuildInputs = [
  python3.pkgs.websocket-client
  python3.pkgs.requests
  python3.pkgs.pillow
  python3.pkgs.xlib
  python3.pkgs.pygobject3
];
propagatedBuildInputs = [
  python3.pkgs.setuptools
    python3.pkgs.pygobject3
    python3.pkgs.pyxdg
  ];
 
  meta = with lib; {
    description = "Yet another discord overlay for linux";
    homepage = "https://github.com/trigg/Discover";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "discover";
  };
}
