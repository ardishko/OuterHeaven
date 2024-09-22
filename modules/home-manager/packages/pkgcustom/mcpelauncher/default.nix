{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  openssl,
  qt6,
}:

stdenv.mkDerivation rec {
  pname = "mcpelauncher-manifest";
  version = "0.14.1-qt6";

  src = fetchFromGitHub {
    owner = "minecraft-linux";
    repo = "mcpelauncher-manifest";
    rev = "v${version}";
    hash = "sha256-Mpgi1iorM+BeLyubpx6uPxF5HxvYVYKgpW/hF0FvlrA=";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [
    cmake
    openssl
    qt6.full
  ];

  meta = with lib; {
    description = "The main repository for the Linux and Mac OS Bedrock edition Minecraft launcher";
    homepage = "https://github.com/minecraft-linux/mcpelauncher-manifest";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "mcpelauncher-manifest";
    platforms = platforms.all;
  };
}
