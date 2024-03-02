{ pkgs, inputs, fetchurl, ... }:
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
    read-aloud = remoteXpiAddon {
      pname = "read-aloud";
      version = "1.67.1";
      addonId = "{ddc62400-f22d-4dd3-8b4a-05837de53c2e}";
      url = "https://addons.mozilla.org/firefox/downloads/file/4219454/read_aloud-1.67.1.xpi";
      sha256 = "sha256-YLkh100nbuIYy7q+Vd0RQ4RN5N0tBWuExkGnDQw06UA=";
    };
    open-tabs-next-to-current = remoteXpiAddon {
      pname = "open-tabs-next-to-current";
      version = "2.0.14";
      addonId = "opentabsnexttocurrent@sblask";
      url = "https://addons.mozilla.org/firefox/downloads/file/3784283/open_tabs_next_to_current-2.0.14.xpi";
      sha256 = "sha256-Q8qQm/k4CPAu8zlrO4/Gsx/qE4x+rnIlKa8mcFgY1sU=";
    };
    premid = remoteXpiAddon {
      pname = "premid";
      version = "2.5.2";
      addonId = "support@premid.app";
      url = "https://dl.premid.app/PreMiD.xpi";
      sha256 = "sha256-VkaZM7M1nO2FqrGFTktNE0n+ipo+szaLyOLc9tCRsC0=";
    };
    catppuccin-frappe-sky = remoteXpiAddon {
      pname = "catppuccin-frappe-sky";
      version = "unknown";
      addonId = "{c7cf6786-24b7-4bd2-ae71-b985fcc98f20}";
      url = "https://github.com/catppuccin/firefox/releases/download/old/catppuccin_frappe_sky.xpi";
      sha256 = "sha256-Fb9VUpsWKtERV4VkeWhBZBSZLMkQMrnBexaRIuPc4Ho=";
    };
    # A: This one's for my friend. It's not referenced anywhere in the conf.
    catppuccin-mocha-lavender = remoteXpiAddon {
      pname = "catppuccin-mocha-lavender";
      version = "unknown";
      addonId = "{8446b178-c865-4f5c-8ccc-1d7887811ae3}";
      url = "https://github.com/catppuccin/firefox/releases/download/old/catppuccin_mocha_lavender.xpi";
      sha256 = "sha256-cCkrC4ZSy6tAjRXSYdxRUPaQ+1u6+W9OcxclbH2beTM=";
    };
    # and this one too
    catppuccin-mocha-green = remoteXpiAddon {
      pname = "catppuccin-mocha-green";
      version = "unknown";
      addonId = "{f4363cd3-9ba9-453d-b2b2-66e6e1bafe73}";
      url = "https://github.com/catppuccin/firefox/releases/download/old/catppuccin_mocha_green.xpi";
      sha256 = "sha256-mKTr2yab/BOFnRBRrgqiVFoFxGms2nvjcOXKmYL54ww=";
    };

    cf-purge-plugin = remoteXpiAddon {
      pname = "Cloudflare Purge Plugin";
      version = "1.5.1";
      addonId = "{0a40b0aa-001b-41c9-a3d7-7f4c4fe77025}";
      url = "https://addons.mozilla.org/firefox/downloads/file/1199228/cf_purge_plugin-1.5.1.xpi";
      sha256 = "sha256-duYhpU5YuVDYNHYTdvI2Do58ZJx5UrmjRjxARUOFNq8=";
    };
    btroblox = remoteXpiAddon {
      pname = "btroblox";
      version = "3.5.0";
      addonId = "btroblox@antiboomz.com";
      url = "https://addons.mozilla.org/firefox/downloads/file/4226524/btroblox-3.5.0.xpi";
      sha256 = "sha256-I5rEKfRv6UVwqAw1poaFHIlrSQpAnjk0jNaYl+3xuVE=";
    };
    google-container = remoteXpiAddon {
      pname = "Google Container";
      version = "1.5.4";
      addonId = "@contain-google";
      url = "https://addons.mozilla.org/firefox/downloads/file/3736912/google_container-1.5.4.xpi";
      sha256 = "sha256-R6fA6FRoMyoNlJko2LdDdhks3kq6oUKAACs6yk7IFNA=";
    };
    watch-on-odysee = remoteXpiAddon {
      pname = "Watch on Odysee";
      version = "2.0.1";
      addonId = "{884679b9-5d6b-48b2-90a7-15ae26ce568a}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3984569/watch_on_odysee-2.0.1.xpi";
      sha256 = "sha256-/aJ0A/b1sRtyAOZizraL2Nlq0nOUfLN9Z+Cf4S7eUDQ=";
    };
    youtube-for-tv = remoteXpiAddon {
      pname = "Youtube for TV";
      version = "0.0.3";
      addonId = "{d2bcedce-889b-4d53-8ce9-493d8f78612a}";
      url = "https://addons.mozilla.org/firefox/downloads/file/3420768/youtube_for_tv-0.0.3.xpi";
      sha256 = "sha256-Xfa7cB4D0Iyfex5y9/jRR93gUkziaIyjqMT0LIOhT6o=";
    };
  };
in {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox;
      profiles = {
        "freeform" = {
          isDefault = true;
          search = {
            force = true;
            default = "Brave";
            privateDefault = "Brave";
            engines = {
              "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "!np" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "!nw" ];
              };
              "Brave" = {
                urls = [{ template = "https://search.brave.com/search?q={searchTerms}"; }];
                updateInterval = 24 * 60 * 60 * 1000; # every day
                definedAliases = [ "!b" ];
              };
              "Bing".metaData.hidden = true;
              "Google".metaData = {
                hidden = true;
                alias = "!g"; # builtin engines only support specifying one additional alias
              };
              "DuckDuckGo".metaData = {
                hidden = true;
                alias = "!ddg";
              };
            };
            order = [
              "Brave"
              "Nix Packages"
              "NixOS Wiki"
            ];
          };
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
            youtube-shorts-block
            return-youtube-dislikes
            (youtube-recommended-videos.overrideAttrs { meta.license.free = true; }) # IDK why it wouldn't build without this. This is retarded.
            (flagfox.overrideAttrs { meta.license.free = true; })
            facebook-container
            (enhancer-for-youtube.overrideAttrs { meta.license.tree = true; })
            read-aloud
            open-tabs-next-to-current
            premid
            cf-purge-plugin
            btroblox
            (w2g.overrideAttrs { meta.license.free = true; })
            watch-on-odysee
            youtube-for-tv
            google-container
            # Theme
            catppuccin-frappe-sky
            #catppuccin-mocha-lavender # over here
            # catppuccin-mocha-green
          ];
          userChrome = ''
            ${builtins.readFile ./userChrome.css}
          '';
          settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.aboutConfig.showWarning" = false;
            "browser.startup.page" = 0;
            "browser.startup.homepage" = "about:home";
            "browser.newtabpage.enabled" = true;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.default.sites" = "";
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;
            "extensions.unifiedExtensions.enabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "browser.ping-centre.telemetry" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";
            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;
            "browser.crashReports.unsubmittedCheck.enabled" = false;
            "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
            "captivedetect.canonicalURL" = "";
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;
            "browser.safebrowsing.malware.enabled" = false;
            "browser.safebrowsing.phishing.enabled" = false;
            "browser.safebrowsing.downloads.enabled" = false;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "browser.safebrowsing.downloads.remote.url" = "";
            "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
            "browser.safebrowsing.downloads.remote.block_uncommon" = false;
            "browser.safebrowsing.allowOverride" = false;
            "privacy.resistFingerprinting.block_mozAddonManager" = true;
            "signon.rememberSignons" = false;
            "gfx.webrender.all" = true;
            "media.ffmpeg.vaapi.enabled" = true;
            "extensions.pocket.enabled" = false;
            "browser.newtabpage.activity-stream.topSitesRows" = 2;
            "browser.newtabpage.pinned" = [
              {
                label = "Youtube";
                url = "https://www.youtube.com/feed/subscriptions";
              }
              {
                label = "Whatsapp";
                url = "https://web.whatsapp.com";
              }
              {
                label = "Discord";
                url = "https://discord.com/app";
              }
              {
                label = "Spreed";
                url = "https://files.ardishco.net/apps/spreed";
              }
              {
                label = "Digicampus";
                url = "https://digicampus.fi";
              }
              {
                label = "ProtonMail";
                url = "https://account.proton.me/mail";
              }
              {
                label = "Github";
                url = "https://github.com";
              }
              {
                label = "DeepL";
                url = "https://deepl.com";
              }
              {
                label = "Router";
                url = "https://192.168.1.1";
              }
              {
                label = "YTMusic";
                url = "https://music.youtube.com/";
              }
            ];
          };
          bookmarks = [
            {
              name = "SAT";
              toolbar = true;
              bookmarks = [
                {
                  name = "Khan Academy SAT Prep";
                  url = "https://www.khanacademy.org/test-prep/digital-sat";
                }
              ];
            }
            {
            name = "Nix";
            toolbar = true;
            bookmarks = [
              {
                  name = "NixOS Wiki";
                  url = "https://nixos.wiki/wiki/";
              }
              {
                  name = "nixiv";
                  url = "https://wiki.nikiv.dev/package-managers/nix/";
              }
              {
                name = "Zero to Nix";
                url = "https://zero-to-nix.com/";
              }
              {
                name = "NixOS & Flakes Book";
                url = "https://nixos-and-flakes.thiscute.world/";
              }
              {
                name = "MyNixOS";
                url = "https://mynixos.com/";
              }
              {
                name = "OuterHeaven";
                url = "https://github.com/liquidovski/OuterHeaven";
              }
              {
                name = "HM Options";
                url = "https://nix-community.github.io/home-manager/options.xhtml";
              }
              {
                name = "nixvim docs";
                url = "https://nix-community.github.io/nixvim/";
              }
              {
                name = "nixpkgs";
                url = "https://github.com/NixOS/nixpkgs/";
              }
              {
                name = "PR Tracker";
                url = "https://nixpk.gs/pr-tracker.html";
              }
              ];
            }
          ];
        };
      };
    };
  };
}
