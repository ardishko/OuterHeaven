{ lib
, stdenv
, fetchFromGitHub
, meson
, ninja
, python3
, gettext
, appstream-glib
, desktop-file-utils
, librsvg
, gtk4
}:

stdenv.mkDerivation rec {
  pname = "video-downloader";
  version = "0.12.12";

  src = fetchFromGitHub {
    owner = "Unrud";
    repo = "video-downloader";
    rev = "v${version}";
    hash = "sha256-b10X2IEPqpLQh+rsoaVN5EOEU8hSrFWq3WqeDV35yI8=";
  };

  nativeBuildInputs = [
    meson
    ninja
    python3
    gettext
    appstream-glib
    librsvg
    gtk4
    desktop-file-utils
  ];

  meta = with lib; {
    description = "Download videos from websites like YouTube and many others (based on yt-dlp";
    homepage = "https://github.com/Unrud/video-downloader";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "video-downloader";
    platforms = platforms.all;
  };
}
