{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "port-wine";
  version = "48v7";

  src = fetchFromGitHub {
    owner = "Castro-Fidel";
    repo = "PortWINE";
    rev = "dotpfx${version}";
    hash = "sha256-A04fGarR7O4fKJ2tsaxuCo+LPtmrmyDtCg7IMoUIsC4=";
  };

  meta = with lib; {
    description = "";
    homepage = "https://github.com/Castro-Fidel/PortWINE";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "port-wine";
    platforms = platforms.all;
  };
}
