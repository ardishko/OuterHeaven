{ pkgs, inputs, ... }:
let
  extra-addons = let
    buildFirefoxXpiAddon = {
      src,
      pname,
      version,
      addonId
    }: pkgs.stdenv.mkDerivation {
      name = "${pname}-${version}";

      inherit src;

      preferLocalBuild = true;
      allowSubstitutes = true;

      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    };

    remoteXpiAddon = { pname, version, addonId, url, sha256 }: buildFirefoxXpiAddon {
      inherit pname version addonId;
      src = pkgs.fetchurl { inherit url sha256; };
    };

    theme = { name, theme }: buildFirefoxXpiAddon {
      pname = "firefox-theme-xpi-${name}";
      version = "1.0";
      addonId = "theme-${name}@outfoxxed.me";
      src = import ./theme.nix { inherit pkgs name theme; };
    };
  in {
    vencord = remoteXpiAddon {
      pname = "vencord";
      version = "1.2.7";
      addonId = "vencord-firefox@vendicated.dev";
      url = "https://addons.mozilla.org/firefox/downloads/file/4123132/vencord_web-1.2.7.xpi";
      sha256 = "A/XKdT0EuDHsQ7mcK9hsXAoAJYUt4Uvp/rtCf/9dAS0=";
    };
  };
in {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox;
      profiles = {
        "freeform" = {
          extensions = with inputs.firefox-addons.packages.${pkgs.system}; with extra-addons; [
            bitwarden
            ublock-origin
            sponsorblock
            darkreader
            dearrow
            enhanced-h264ify
            firefox-color
            fx_cast
            iina-open-in-mpv
            protondb-for-steam
            sidebery
            terms-of-service-didnt-read
            vimium-c
            gesturefy
            no-pdf-download
            istilldontcareaboutcookies
            violentmonkey
            stylus
            torrent-control
            to-deepl
            blocktube
            decentraleyes
            clearurls
            user-agent-string-switcher
            wayback-machine
          ];
          userChrome = ''
            ${builtins.readFile ./sideberry_chrome.css}
          '';
        };
      };
    };
  };
}
