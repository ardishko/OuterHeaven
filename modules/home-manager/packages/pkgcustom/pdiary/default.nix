{
  lib,
  python3Packages,
  fetchFromGitHub,
  fetchurl,
  pkgs,
}:
let
  sqlcipher3-binary = python3Packages.buildPythonPackage rec {
    pname = "sqlcipher3-binary";
    version = "0.5.2";

    #disabled = pythonOlder "3.6";

    # if needed
    buildInputs = [ pkgs.sqlcipher ];

    format = "setuptools";

    src = fetchFromGitHub {
      owner = "coleifer";
      repo = "sqlcipher3";
      rev = version;
      sha256 = "sha256-RUwyGMv0za1N4OOz5YKP4Ma9NRHGpt9U4zssl9Gy00o";
    };

    meta = {
      description = "DB-API 2.0 interface for SQLCipher 3.x";
      homepage = "https://github.com/coleifer/sqlcipher3";
      license = lib.licenses.gpl3Only;
      maintainers = with lib.maintainers; [ Alxhr0 ];
    };
  };
  npyscreen-master = python3Packages.npyscreen.overrideAttrs {
    src = fetchurl {
      url = "https://github.com/jwoglom/npyscreen/archive/master.tar.gz";
      sha256 = "sha256-2crL/c1C+yRLRwb1T7enD28aB+TKY4Vxp+lAaMEv/JI=";
    };
  };
in
python3Packages.buildPythonPackage rec {
  pname = "pdiary";
  version = "1.65";
  pyproject = true;

  buildInputs = [
    pkgs.sqlcipher
    sqlcipher3-binary
    python3Packages.setuptools
  ];

  propagatedBuildInputs = [
    python3Packages.pysqlcipher3
    python3Packages.peewee
    npyscreen-master
  ];

  src = fetchFromGitHub {
    owner = "manipuladordedados";
    repo = "pdiary";
    rev = version;
    hash = "sha256-lsU1vouJNTjaGAjzGknIh+tOH8o4SIHT98pbniq1nPM=";
  };

  postPatch = ''
    substituteInPlace setup.cfg \
    --replace 'sqlcipher3-binary>=0.4.0' ""
  '';

  pythonImportsCheck = [ "pdiary" ];

  meta = with lib; {
    description = "A simple terminal diary journal application written in Python with encryption support";
    homepage = "https://github.com/manipuladordedados/pdiary";
    changelog = "https://github.com/manipuladordedados/pdiary/blob/${src.rev}/CHANGELOG.md";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ Alxhr0 ];
    mainProgram = "pdiary";
  };
}
