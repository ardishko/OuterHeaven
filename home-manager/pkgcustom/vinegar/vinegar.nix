{ pkgs
, lib
, buildGoModule
, fetchFromGitHub ? pkgs.fetchFromGitHub
, wine
, symlinkJoin
, makeWrapper
, pkg-config
, libGL
, libxkbcommon
, xorg
}: let
	version = "1.5.8";
	unwrapped = buildGoModule rec {
		pname = "vinegar";
		inherit version;
		src = fetchFromGitHub {
			owner = "vinegarhq";
			repo = "vinegar";
			rev = "v${version}";
			hash = "sha256-1KDcc9Hms1hQgpvf/49zFJ85kDUsieNcoOTYaZWV+S0=";
		};
		vendorHash = "sha256-UJLwSOJ4vZt3kquKllm5OMfFheZtAG5gLSA20313PpA=";
		makeFlags = [
			"PREFIX=$(out)"
			"VERSION=${version}"
		];
		buildPhase = ''
			runHook preBuild
			make $makeFlags
			runHook postBuild
		'';
		installPhase = ''
			runHook preInstall
			make install $makeFlags
			runHook postInstall
		'';
		nativeBuildInputs = [ pkg-config ];
		buildInputs = [ libGL libxkbcommon xorg.libX11 xorg.libXcursor xorg.libXfixes ];
	};
in symlinkJoin {
	name = "vinegar";
	paths = [ unwrapped ];
	buildInputs = [ makeWrapper ];
	meta = with lib; {
		description = "An open-source, minimal, configurable, fast bootstrapper for running Roblox on Linux";
		homepage = "https://github.com/vinegarhq/vinegar";
		changelog = "https://github.com/vinegarhq/vinegar/releases/tag/v${version}";
		mainProgram = "vinegar";
		license = licenses.gpl3Only;
		maintainers = with maintainers; [ ];
	};
	postBuild = ''
		wrapProgram $out/bin/vinegar \
			--prefix PATH : ${lib.makeBinPath [ wine ]}
	'';
}