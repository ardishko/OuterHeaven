{
  lib,
  stdenv,
  fetchFromGitLab,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "rstmcpp";
  version = "0-unstable-2023-04-02";

  src = fetchFromGitLab {
    owner = "beelzy";
    repo = "rstmcpp";
    rev = "fe8bee01a5009997ec23e7599cafc1b2bdfad364";
    hash = "sha256-T9mxTBj/eykvbBkbmEKTUFldtBp3cJgWAbeu44SwxiM=";
    fetchSubmodules = true; # gc-dspadpcm-encode (the DSP encoder)
  };

  # Upstream Makefile has a single `all` rule and no install target; the binary
  # lands in the source root.
  installPhase = ''
    runHook preInstall
    install -Dm755 rstmcpp -t "$out/bin"
    install -Dm644 LICENSE -t "$out/share/licenses/rstmcpp"
    runHook postInstall
  '';

  meta = {
    description = "WAV to 3DS theme audio (bcstm/bcwav) converter; audio backend for kame-editor";
    homepage = "https://gitlab.com/beelzy/rstmcpp";
    license = lib.licenses.mit;
    mainProgram = "rstmcpp";
    platforms = lib.platforms.linux;
  };
})
