{ lib
, stdenv
, fetchFromGitHub
, python3
, cmake
}:

stdenv.mkDerivation rec {
  pname = "nohang";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "hakavlad";
    repo = "nohang";
    rev = "v${version}";
    hash = "sha256-aRiBGnJHdtQ5euvJ4DSuCZO5i5OJVRiCesaatrIARmg=";
  };
  buildInputs = [
    cmake
  ];
  installPhase = ''
    mkdir -p "$out"
    mkdir -p "$out/usr"
    mkdir -p "$out/usr/local"
    mkdir -p "$out/usr/local/sbin"
    make install
  '';
  meta = with lib; {
    description = "A sophisticated low memory handler for Linux";
    homepage = "https://github.com/hakavlad/nohang";
    changelog = "https://github.com/hakavlad/nohang/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "nohang";
    platforms = platforms.all;
  };
}
