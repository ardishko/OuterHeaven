{ buildDotnetModule
, dotnetCorePackages
, fetchFromGitHub
, lib
, nexus-mods-app
, runCommand
}:
buildDotnetModule rec {
  pname = "nexus-mods-app";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "Nexus-Mods";
    repo = "NexusMods.App";
    rev = "17bf70e8136b4f8daebaef291817e397cd0b9476";
    hash = "sha256-B481sxlM5PKOP6o6/gtcIIbzJ6iziCrXOOr54dsynv0=";
  };

  projectFile = "src/NexusMods.App/NexusMods.App.csproj";

  nugetDeps = ./deps.nix;

  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  dotnet-runtime = dotnetCorePackages.runtime_8_0;

  passthru.tests = {
    serve = runCommand "${pname}-test-serve" { } ''
      ${nexus-mods-app}/bin/NexusMods.App
      touch $out
    '';
    help = runCommand "${pname}-test-help" { } ''
      ${nexus-mods-app}/bin/NexusMods.App --help
      touch $out
    '';
    associate-nxm = runCommand "${pname}-test-associate-nxm" { } ''
      ${nexus-mods-app}/bin/NexusMods.App associate-nxm
      touch $out
    '';
    list-tools = runCommand "${pname}-test-list-tools" { } ''
      ${nexus-mods-app}/bin/NexusMods.App list-tools
      touch $out
    '';
  };

  meta = with lib; {
    description = "Game mod installer, creator and manager";
    mainProgram = "NexusMods.App";
    homepage = "https://github.com/Nexus-Mods/NexusMods.App";
    changelog = "https://github.com/Nexus-Mods/NexusMods.App/releases/tag/${src.rev}";
    license = with licenses; [ gpl3 ];
    maintainers = with maintainers; [ l0b0 ];
  };
}
