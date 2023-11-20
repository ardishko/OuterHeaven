{ lib
, stdenv
, fetchFromGitHub
, make
}:

stdenv.mkDerivation rec {

  pname = "sgd-boop";
  version = "1.2.8";

  src = fetchFromGitHub {
    owner = "SteamGridDB";
    repo = "SGDBoop";
    rev = "v${version}";
    hash = "sha256-bdSzTwObMEBe1pHTDwXeJ3GXmOwwFp4my7qTmifX218=";
  };
  
  buildPhase = ''
	gcc sgdboop.c curl-helper.c string-helpers.c crc.c -liup -lcurl -o $out/SGDBoop
  '';
  
    meta = with lib; {
    description = "A program used for applying custom artwork to Steam, using SteamGridDB. Supports both Windows and Linux, written completely in C";
    homepage = "https://github.com/SteamGridDB/SGDBoop/";
    license = licenses.cc-by-nc-sa-40;
    maintainers = with maintainers; [  ];
    mainProgram = "sgd-boop";
    platforms = platforms.all;
  };
}
