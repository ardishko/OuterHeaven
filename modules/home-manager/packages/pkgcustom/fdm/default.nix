{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  wrapGAppsHook,
  autoPatchelfHook,
  udev,
  libdrm,
  libpqxx,
  unixODBC,
  gst_all_1,
}:

stdenv.mkDerivation rec {
  pname = "freedownloadmanager";
  version = "6.25.0";

  src = fetchurl {
    url = "https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb";
    hash = "sha256-qTc2PIIfW+YuSAb8z3Vpf2bTdhumoZXOATsBUG2EYTY=";
  };

  unpackPhase = "dpkg-deb -x $src .";

  nativeBuildInputs = [
    dpkg
    wrapGAppsHook
    autoPatchelfHook
  ];

  buildInputs =
    [
      libdrm
      libpqxx
      unixODBC
      stdenv.cc.cc
    ]
    ++ (with gst_all_1; [
      gstreamer
      gst-libav
      gst-plugins-base
      gst-plugins-good
      gst-plugins-bad
      gst-plugins-ugly
    ]);

  runtimeDependencies = [
    (lib.getLib udev)
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp -r opt/freedownloadmanager $out
    cp -r usr/share $out
    ln -s $out/freedownloadmanager/fdm $out/bin/${pname}

    substituteInPlace $out/share/applications/freedownloadmanager.desktop \
      --replace 'Exec=/opt/freedownloadmanager/fdm' 'Exec=${pname}' \
      --replace "Icon=/opt/freedownloadmanager/icon.png" "Icon=$out/freedownloadmanager/icon.png"
  '';

  meta = with lib; {
    description = "A smart and fast internet download manager";
    homepage = "https://www.freedownloadmanager.org";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    maintainers = with maintainers; [ ];
  };
}
