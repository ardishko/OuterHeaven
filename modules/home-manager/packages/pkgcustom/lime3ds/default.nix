{ lib
, stdenv
, fetchFromGitHub
, cmake
, qt6
, SDL2
, portaudio
, gcc_multi
, pipewire
, xorg
, spirv-tools
, pulseaudio
, git
, openssl
, jack1
, sndio
}:
stdenv.mkDerivation rec {
  pname = "lime3ds";
  version = "2109";

  src = fetchFromGitHub {
    owner = "Lime3DS";
    repo = "Lime3DS";
    rev = "2733189c0d548228f34a127e264d0afa4507e30e";
    hash = "sha256-BHkzOo5hFmwR/9N3Tg5p6qpZJQVk0x4R0voQpYsnaDs=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    qt6.full
    SDL2
    portaudio
    gcc_multi
    pipewire
    xorg.libX11
    xorg.libXext
    spirv-tools
    pulseaudio
    git
    openssl
    jack1
    sndio
  ];
  
  cmakeFlags = [
    "-DCMAKE_POLICY_DEFAULT_CMP0025=NEW"
    "--no-warn-unused-cli"
    # "-DCMAKE_BUILD_TYPE=Release"
  ];

  meta = with lib; {
    description = "A Nintendo 3DS emulator based on Citra";
    homepage = "https://github.com/Lime3DS/Lime3DS";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ ];
    mainProgram = "lime3ds";
    platforms = platforms.all;
  };
}
