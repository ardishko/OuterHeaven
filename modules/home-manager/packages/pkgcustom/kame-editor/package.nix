{
  lib,
  stdenv,
  fetchFromGitLab,
  qmake,
  wrapQtAppsHook,
  qtbase,
  portaudio,
  libGL,
  # Optional runtime tools. They are invoked by name via QProcess, so they only
  # need to be on PATH. vgmstream is in nixpkgs; kame-tools and rstmcpp are not,
  # so they default to null and the matching features stay disabled until you
  # supply them (e.g. via overlays).
  vgmstream ? null, # provides `vgmstream-cli`: audio preview/metadata
  kame-tools ? null, # provides `kame-tools`: bundling/deploying theme files
  rstmcpp ? null, # provides `rstmcpp`: wav -> theme audio conversion
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "kame-editor";
  version = "1.4.1-unstable-2026-07-09";

  src = fetchFromGitLab {
    owner = "beelzy";
    repo = "kame-editor";
    # Pin an exact commit. Replace rev+hash when bumping.
    rev = "93b5de0e71cdf684180a5ab1d1280f4f862d7cac";
    hash = "sha256-snC+JYSPBNQpoftejq/PcxObGAvK/fpOiS4BJtbXkLg=";
  };

  nativeBuildInputs = [
    qmake
    wrapQtAppsHook
  ];

  buildInputs = [
    qtbase
    portaudio
    libGL
  ];

  # The .pro computes GIT_VERSION from `git describe`, which is unavailable in a
  # clean build tree. Pin it so the About box shows something deterministic and
  # the build never depends on git being present.
  postPatch = ''
    substituteInPlace kame-editor.pro \
      --replace-fail 'GIT_VERSION = $$system(git --git-dir $$PWD/.git --work-tree $$PWD describe --always --tags)' \
                     'GIT_VERSION = ${finalAttrs.version}'
  '';

  enableParallelBuilding = true;

  # Put the optional tools on the wrapped binary's PATH.
  qtWrapperArgs =
    let
      runtimeTools = lib.filter (x: x != null) [
        vgmstream
        kame-tools
        rstmcpp
      ];
    in
    lib.optionals (runtimeTools != [ ]) [
      "--prefix PATH : ${lib.makeBinPath runtimeTools}"
    ];

  installPhase = ''
    runHook preInstall

    install -Dm755 build/kame-editor -t $out/bin
    install -Dm644 kame-editor.desktop -t $out/share/applications

    for png in resources/icons/icon-*.png; do
      size=$(echo "$png" | grep -oE '[0-9]+x[0-9]+')
      install -Dm644 "$png" "$out/share/icons/hicolor/$size/apps/kame-editor.png"
    done
    if [ -f resources/icons/icon.svg ]; then
      install -Dm644 resources/icons/icon.svg \
        "$out/share/icons/hicolor/scalable/apps/kame-editor.svg"
    fi

    runHook postInstall
  '';

  meta = {
    description = "3DS theme editor built with Qt6, frontend for kame-tools";
    homepage = "https://gitlab.com/beelzy/kame-editor";
    license = lib.licenses.gpl3Plus;
    mainProgram = "kame-editor";
    platforms = lib.platforms.linux;
    # maintainers = [ ]; # add yourself before upstreaming
  };
})
