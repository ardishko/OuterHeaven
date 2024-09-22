{
  stdenv,
  lib,
  unzip,
  appimage-run,
  addOpenGLRunpath,
  libGLU,
  xorg,
  buildFHSUserEnv,
  bash,
  writeText,
  ocl-icd,
  xkeyboard_config,
  glib,
  libarchive,
  python,
  dbus,
}:

let
  davinci = stdenv.mkDerivation rec {
    pname = "davinci-resolve";
    version = "18.0b3";

    nativeBuildInputs = [
      unzip
      appimage-run
      addOpenGLRunpath
    ];

    # Pretty sure, there are missing dependencies ...
    buildInputs = [
      libGLU
      xorg.libXxf86vm
    ];

    src = /home/luke/Downloads/DaVinci_Resolve_Studio_${version}_Linux.zip;
    # The unpack phase won't generate a directory
    setSourceRoot = ''
      sourceRoot=$PWD
    '';

    installPhase = ''
              runHook preInstall

              export HOME=$PWD/home
              mkdir -p $HOME

              mkdir -p $out
              appimage-run ./DaVinci_Resolve_Studio_${version}_Linux.run -i -y -n -C $out

              mkdir -p $out/{configs,DolbyVision,easyDCP,Fairlight,GPUCache,logs,Media,"Resolve Disk Database",.crashreport,.license,.LUT}

              tar -zf $out/share/panels/dvpanel-framework-linux-x86_64.tgz -C $out -x
      #        mv $out/libDaVinciPanelAPI.so $out/libs/
              runHook postInstall
    '';

    dontStrip = true;

    postFixup = ''
      addExtraLibPaths() {
        local origRpath="$(patchelf --print-rpath "$1")"
        patchelf --set-rpath "$origRpath:$out/libs:$out:$out:$out/lib:$out/bin:/usr/lib:/usr/lib64:${dbus.lib}/lib" "$1"
      }

      for program in $out/bin/* $out/*.so; do
        isELF "$program" || continue
        addOpenGLRunpath "$program"
        addExtraLibPaths "$program"
      done

      for program in $out/libs/*; do
        isELF "$program" || continue
        if [[ "$program" != *"libcudnn_cnn_infer"* ]];then
          echo $program
          addOpenGLRunpath "$program"
          addExtraLibPaths "$program"
        fi
      done
    '';
  };
in
buildFHSUserEnv {
  name = "davinci-resolve";
  targetPkgs =
    pkgs: with pkgs; [
      librsvg
      libGLU
      libGL
      xorg.libICE
      xorg.libSM
      xorg.libXxf86vm
      xorg.libxcb
      udev
      opencl-headers
      alsa-lib
      xorg.libX11
      xorg.libXext
      expat
      zlib
      libuuid
      bzip2
      libtool
      ocl-icd
      glib
      libarchive
      xdg-utils # xdg-open needed to open URLs
      python
      dbus
      # currently they want python 3.6 which is EOL
      #python3
    ];

  runScript = "${bash}/bin/bash ${writeText "davinci-wrapper" ''
    export QT_XKB_CONFIG_ROOT="${xkeyboard_config}/share/X11/xkb"
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${davinci}/libs
    ${davinci}/bin/resolve
  ''}";

  extraBuildCommands = ''
    ln -s ${davinci}/libDaVinciPanelAPI.so $out/usr/lib64/
  '';

  meta = with lib; {
    description = "Professional Video Editing, Color, Effects and Audio Post";
    homepage = "https://www.blackmagicdesign.com/products/davinciresolve/";
    license = licenses.unfree;
    maintainers = with maintainers; [ jshcmpbll ];
    platforms = platforms.linux;
  };
}
