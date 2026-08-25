{
  lib,
  stdenv,
  fetchFromGitLab,
  git,
  zip,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "kame-tools";
  version = "1.3.8-unstable-2024-11-01";

  src = fetchFromGitLab {
    owner = "beelzy";
    repo = "kame-tools";
    rev = "a1fe47cc247973828b494bad940008527b6a0c96";
    hash = "sha256-ETl5f8M4OJPFB7NEq2mVuMm4RhBtAbMzlrvGHD14zXw=";
    fetchSubmodules = true; # pulls the buildtools Makefile base
  };

  # git is only invoked to derive a version, which we override via makeFlags;
  # keep it around so the Makefile's `$(shell git ...)` doesn't warn. zip is
  # used by the Makefile's default target to package the built binary.
  nativeBuildInputs = [
    git
    zip
  ];

  # aarch64 needs a patch applied inside the buildtools submodule.
  prePatch = lib.optionalString stdenv.hostPlatform.isAarch64 ''
    ( cd buildtools && patch -p1 < ../aarch64.patch )
  '';

  # NATIVE target = host binary. Pin the version parts so kame-editor's
  # feature checks (needs >= 1.3.2) see the right number.
  makeFlags = [
    "TARGET=NATIVE"
    "VERSION_MAJOR=1"
    "VERSION_MINOR=3"
    "VERSION_MICRO=8"
  ];

  enableParallelBuilding = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 "$(find output -type f -name kame-tools | head -n1)" "$out/bin/kame-tools"
    install -Dm644 LICENSE.txt -t "$out/share/licenses/kame-tools"
    runHook postInstall
  '';

  meta = {
    description = "CLI for bundling 3DS theme files; backend for kame-editor (bannertool fork)";
    homepage = "https://gitlab.com/beelzy/kame-tools";
    license = lib.licenses.mit;
    mainProgram = "kame-tools";
    platforms = lib.platforms.linux;
  };
})
