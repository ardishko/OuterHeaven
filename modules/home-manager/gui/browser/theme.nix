{
  pkgs,
  name,
  theme,
}:
let
  json = builtins.toJSON {
    manifest_version = 2;
    version = "1.0";
    browser_specific_settings.gecko = {
      id = "theme-${name}@outfoxxed.me";
    };

    inherit name theme;
  };

  jsonFile = pkgs.writeTextFile {
    name = "manifest.json";
    text = json;
  };
in
pkgs.stdenvNoCC.mkDerivation {
  pname = "firefox-theme-${name}.xpi";
  version = "1.0";
  preferLocalBuild = true;
  unpackPhase = "true";

  buildPhase = ''
    cp ${jsonFile} manifest.json
    ${pkgs.zip}/bin/zip out.xpi manifest.json
  '';

  installPhase = ''
    mv out.xpi $out
  '';
}
