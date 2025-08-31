{
  lib,
  steam-run,
  bash,
  fetchurl,
  stdenv,
  makeWrapper,
}:
stdenv.mkDerivation rec {
  pname = "eden";
  version = "v0.0.3-rc3";
  src = fetchurl {
    url = "https://github.com/eden-emulator/Releases/releases/download/${version}/Eden-Linux-${version}-amd64.AppImage";
    hash = "sha256-ipgIJVwu/EVGanSZZRubkN7nhmTamMYtMxYxixckftc=";
  };

  icon = ./org.eden_emu.eden.svg;

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/applications
    mkdir -p $out/share/icons/hicolor/scalable/apps
    mkdir -p $out/opt/${pname}

    # Copy AppImage to $out/opt
    cp $src $out/opt/${pname}/${pname}.AppImage
    chmod +x $out/opt/${pname}/${pname}.AppImage

    # Copy icon to $out/share/icons
    cp ${icon} $out/share/icons/hicolor/scalable/apps/org.eden_emu.eden.svg

    # Wrap with steam-run
    wrapProgram $out/opt/${pname}/${pname}.AppImage \
      --prefix PATH : ${steam-run}/bin \
      --argv0 $out/bin/${pname}

    # Simpler: create wrapper script manually
    cat > $out/bin/${pname} <<EOF
    #!${bash}/bin/bash
    ${steam-run}/bin/steam-run $out/opt/${pname}/${pname}.AppImage
    EOF
    chmod +x $out/bin/${pname}

    # Desktop entry
    cat > $out/share/applications/${pname}.desktop <<EOF
    [Desktop Entry]
    Type=Application
    Name=Eden
    GenericName=Switch Emulator
    Comment=Nintendo Switch video game console emulator
    Exec=${pname}
    Icon=org.eden_emu.eden
    Categories=Game;Emulator;Qt;
    MimeType=application/x-nx-nro;application/x-nx-nso;application/x-nx-nsp;application/x-nx-xci;
    Keywords=Nintendo;Switch;
    StartupWMClass=eden
    EOF
  '';

  meta = with lib; {
    description = "Nintendo Switch emulator (Eden fork)";
    longDescription = ''
      Eden is an experimental open-source emulator for the Nintendo Switch,
      built with performance and stability in mind. It is a fork of yuzu
      that aims to continue development.
    '';
    homepage = "https://eden-emu.dev/";
    license = licenses.gpl3Plus;
    maintainers = [ ]; # Add your name here if you want
    platforms = platforms.linux;
    mainProgram = "eden";
  };
}
