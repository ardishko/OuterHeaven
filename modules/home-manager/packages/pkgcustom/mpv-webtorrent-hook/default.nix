{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation rec {
  pname = "mpv-webtorrent-hook";
  version = "unstable-2024-05-26";

  src = fetchFromGitHub {
    owner = "noctuid";
    repo = "mpv-webtorrent-hook";
    rev = "e5ce4fc29a7a73178772699073c48cf3395ccad6";
    hash = "sha256-szzsXdX0k69qmcbc8vIB/lWNvvOkCu2Y76c+VDuo3/w=";
  };
  preInstall = '' 
    mkdir -p "$out/" 
    '';

  meta = with lib; {
    description = "Stream torrents in mpv using webtorrent-cli";
    homepage = "https://github.com/noctuid/mpv-webtorrent-hook";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "mpv-webtorrent-hook";
    platforms = platforms.all;
  };
}
