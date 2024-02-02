{ lib
, stdenv
, fetchFromGitHub
, pkgs
}:

stdenv.mkDerivation rec {
  pname = "xampp";
  version = "unstable-2020-06-20";

  src = fetchFromGitHub {
    owner = "xampp-phoenix";
    repo = "xampp";
    rev = "0da75038a318a9da997706bc8c1f8d80350c2194";
    hash = "sha256-OGnTR4kRNoBqS+iHU8NhFM1Kuub+xXDUixadnmbNvjg=";
  };

  buildInputs = [ pkgs.perl ];

  meta = with lib; {
    description = "";
    homepage = "https://github.com/xampp-phoenix/xampp";
    license = licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with maintainers; [ ];
    mainProgram = "xampp";
    platforms = platforms.all;
  };
}
