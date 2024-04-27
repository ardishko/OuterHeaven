{ lib
, stdenv
, fetchFromGitHub
, jre
}:

stdenv.mkDerivation rec {
  pname = "nook-desktop";
  version = "1.0.10";

  src = fetchFromGitHub {
    owner = "mn6";
    repo = "nook-desktop";
    rev = "v${version}";
    hash = "sha256-FQQxxPr1yAxxCxHE1Nedr2cZ036FekWwGpyOBGFKSdQ=";
  };

  buildInputs = [ jre ];
  
  meta = with lib; {
    description = "Desktop version of Nook, since Chrome MV3 will render it unusable";
    homepage = "https://github.com/mn6/nook-desktop";
    license = licenses.gpl2; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ ];
    mainProgram = "nook-desktop";
    platforms = platforms.all;
  };
}
