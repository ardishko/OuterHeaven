{
  pkgs,
  inputs,
  ...
}:
let
  extra-addons =
    let
      buildFirefoxXpiAddon =
        {
          src,
          pname,
          version,
          addonId,
        }:
        pkgs.stdenv.mkDerivation {
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
      remoteXpiAddon =
        {
          pname,
          version,
          addonId,
          url,
          sha256,
        }:
        buildFirefoxXpiAddon {
          inherit pname version addonId;
          src = pkgs.fetchurl { inherit url sha256; };
        };
    in
    {
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
      catppuccin-frappe-sky = remoteXpiAddon {
        pname = "catppuccin-frappe-sky";
        version = "unknown";
        addonId = "{c7cf6786-24b7-4bd2-ae71-b985fcc98f20}";
        url = "https://github.com/catppuccin/firefox/releases/download/old/catppuccin_frappe_sky.xpi";
        sha256 = "0yp0vkij548ngg0vjchhr4n9j53485l7jr45aw8x2ahnkd95bgqm";
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
      netflux = remoteXpiAddon {
        pname = "Netflux";
        version = "1.0.11";
        addonId = "{b6d82d4f-9fc6-47f1-9191-bbabf829977c}";
        url = "https://addons.mozilla.org/firefox/downloads/file/4382056/netflux-1.0.11.xpi";
        sha256 = "sha256-R/Fz1nBljHLZValUnTRY3yNKM2HUvfx2+ph9QIppn2g=";
      };
      leechblock-ng = remoteXpiAddon {
        pname = "leechblock-ng";
        version = "1.7.2";
        addonId = "leechblockng@proginosko.com";
        url = "https://addons.mozilla.org/firefox/downloads/file/4657335/leechblock_ng-1.7.2.xpi";
        sha256 = "sha256:1rf1p27xr49wlzxcyp8j3g33fcjk5c07z5b68wlgwllszp66cd8k";
      };
      arsenal-support = remoteXpiAddon {
        pname = "arsenal-support-extension";
        version = "2026.5.2";
        addonId = "@ext.arsenal.app";
        url = "https://addons.mozilla.org/firefox/downloads/file/4812959/arsenal_support_extension-2026.5.2.xpi";
        sha256 = "sha256:0n0wxkrr6lqkb4d0f9ylr8d7r0phfvd55n4xi5p2s0lpwjkm87f1";
      };
    };
in
{
  # home.file.".librewolf/freeform/chrome/img/wallpaper.jpg".source = ./wallpaper.jpg;
  programs.librewolf = {
    enable = true;

    # setAsDefaultBrowser has NO equivalent on the librewolf module.
    # Set the default browser via xdg.mimeApps instead, e.g.:
    #   xdg.mimeApps.defaultApplications = {
    #     "x-scheme-handler/http"  = "librewolf.desktop";
    #     "x-scheme-handler/https" = "librewolf.desktop";
    #     "text/html"              = "librewolf.desktop";
    #   };

    settings = {
      "media.eme.enabled" = true;
      "media.gmp-provider.enabled" = true;
      # if something breaks, set the option below to "false"
      "privacy.resistFingerprinting" = false;
      "privacy.fingerprintingProtection" = true;
      "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
    };

    profiles."freeform" = {
      isDefault = true;
      search = {
        force = true;
        default = "Brave";
        privateDefault = "Brave";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "!np" ];
          };
          "NixOS Wiki" = {
            urls = [ { template = "https://nixos.wiki/index.php?search={searchTerms}"; } ];
            icon = "https://nixos.wiki/favicon.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "!nw" ];
          };
          "NixOS Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "!no" ];
          };
          "ProtonDB" = {
            urls = [ { template = "https://www.protondb.com/search?q={searchTerms}"; } ];
            icon = "https://icons.iconarchive.com/icons/simpleicons-team/simple/256/protondb-icon.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "!pdb" ];
          };
          # NOTE: in your Zen file both "ddg" and "qwant" claimed "!q". Duplicate
          # aliases collide. I left qwant on "!q" and ddg uses "!ddg" (you also
          # set ddg.metaData.alias = "!ddg" below, so this matches your intent).
          "ddg" = {
            urls = [ { template = "https://duckduckgo.com/?t=h_&q={searchTerms}"; } ];
            icon = "https://images.icon-icons.com/2429/PNG/512/duckduckgo_logo_icon_147296.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "!ddg" ];
          };
          "qwant" = {
            urls = [ { template = "https://www.qwant.com/?q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/2/2b/Qwant-Icone-2022.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "!q" ];
          };
          "Brave" = {
            urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/5/51/Brave_icon_lionface.png";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "!b" ];
          };
          "Qwant Images" = {
            urls = [ { template = "https://www.qwant.com/?t=images&q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/2/2b/Qwant-Icone-2022.svg";
            updateInterval = 24 * 60 * 60 * 1000;
            definedAliases = [ "!i" ];
          };
          "Flathub" = {
            urls = [ { template = "https://flathub.org/apps/search?q={searchTerms}"; } ];
            icon = "https://styles.redditmedia.com/t5_3k6jw/styles/communityIcon_b1hyv6wssjd91.png";
            updateInterval = 24 * 60 * 1000;
            definedAliases = [
              "!f"
              "!flathub"
              "!flatpak"
            ];
          };
          "Github Code" = {
            urls = [ { template = "https://github.com/search?q={searchTerms}&type=code"; } ];
            definedAliases = [
              "!code"
              "!ghc"
              "!gc"
            ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/9/91/Octicons-mark-github.svg";
            updateInterval = 24 * 60 * 1000;
          };
          "Github Repos" = {
            urls = [ { template = "https://github.com/search?q={searchTerms}&type=repositories"; } ];
            definedAliases = [
              "!gh"
              "!repo"
            ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/9/91/Octicons-mark-github.svg";
            updateInterval = 24 * 60 * 1000;
          };
          "Youtube" = {
            urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
            # FIXED: your Zen file had "definedAliasses" (typo, double s), so
            # !yt/!y silently never worked. Corrected here.
            definedAliases = [
              "!yt"
              "!y"
            ];
            icon = "https://imgs.search.brave.com/0s_rkLjPXG0u6MFQl24I-Debkq4Mp8JmX04Any5mq6c/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZy/ZWVwaWsuY29tLzI1/Ni8xMzg0LzEzODQw/NjAucG5n";
            updateInterval = 24 * 60 * 1000;
          };
          "bing".metaData.hidden = true;
          "google".metaData = {
            hidden = true;
            alias = "!g";
          };
          "ddg".metaData = {
            alias = "!ddg";
          };
        };
        order = [
          "Brave"
          "qwant"
          "google"
          "ddg"
          "Nix Packages"
          "NixOS Wiki"
          "Youtube"
          "Flathub"
        ];
      };
      extensions = {
        packages =
          with inputs.firefox-addons.packages.${pkgs.system};
          with extra-addons;
          [
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
            terms-of-service-didnt-read
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
            (youtube-recommended-videos.overrideAttrs { meta.license.free = true; })
            (flagfox.overrideAttrs { meta.license.free = true; })
            (enhancer-for-youtube.overrideAttrs { meta.license.tree = true; })
            facebook-container
            read-aloud
            open-tabs-next-to-current
            cf-purge-plugin
            btroblox
            watch-on-odysee
            youtube-for-tv
            google-container
            leechblock-ng
            arsenal-support
            catppuccin-frappe-sky # Theme
          ];
      };

      userChrome = ''
        ${builtins.readFile ./userChrome.css}
      '';
      userContent = ''
        ${builtins.readFile ./userContent.css}
      '';

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # Helps declaratively-installed extensions auto-enable on first launch
        # instead of showing up disabled. Not in your Zen file; added because
        # LibreWolf/Firefox often need it. Remove if you prefer manual enable.
        "extensions.autoDisableScopes" = 0;
        "browser.aboutConfig.showWarning" = false;
        "browser.startup.page" = 0;
        "browser.preferences.experimental" = true;
        "browser.startup.homepage" = "about:home";
        "browser.newtabpage.enabled" = true;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "extensions.unifiedExtensions.enabled" = false;
        # telemetry block: ALL redundant on LibreWolf (off by default
        # already) but harmless.
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
        # safebrowsing popups ("are you sure you want to continue?" popup)
        "browser.safebrowsing.malware.enabled" = true;
        "browser.safebrowsing.phishing.enabled" = true;
        "browser.safebrowsing.downloads.enabled" = true;
        "browser.safebrowsing.downloads.remote.enabled" = true;
        "browser.safebrowsing.downloads.remote.url" = "";
        "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = true;
        "browser.safebrowsing.downloads.remote.block_uncommon" = true;
        "browser.safebrowsing.allowOverride" = true;

        "privacy.resistFingerprinting.block_mozAddonManager" = true;
        "signon.rememberSignons" = false;
        "gfx.webrender.all" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "extensions.pocket.enabled" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 2;
        "general.smoothScroll" = true;
        "general.autoScroll" = true;
        # cookies and history
        "network.cookie.lifetimePolicy" = 0;
        "privacy.clearOnShutdown.cookies" = false;
        "browser.formfill.enable" = true;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.trackingprotection.allow_list.baseline.enabled" = true;
        # --- sidebar / vertical tabs ---
        # sidebar.revamp + sidebar.verticalTabs are real Firefox prefs and may
        # work on your LibreWolf version. BUT "aichat" in sidebar.main.tools is
        # Firefox's AI sidebar, which LibreWolf strips, so that entry is a no-op.
        "sidebar.revamp" = false;
        "sidebar.verticalTabs" = false;
        "sidebar.main.tools" = "syncedtabs,history,bookmarks"; # dropped "aichat"
        "sidebar.visibility" = "always-show";
        "sidebar.position_start" = true;
        "devtools.toolbox.sidebar.width" = 480;
        "browser.newtabpage.activity-stream.showRecentSaves" = false;
        "browser.taskbar.lists.enabled" = false;
        "browser.taskbar.lists.frequent.enabled" = false;
        "browser.taskbar.lists.tasks.enabled" = false;
        "browser.newtabpage.activity-stream.enabled" = false;
        "browser.tabs.inTitlebar" = 0;
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
            url = "https://nextcloud.ardishco.net/apps/spreed";
          }
          {
            label = "TSI Student Portal";
            url = "https://my.tsi.lv/";
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
          {
            label = "Crunchyroll";
            url = "https://www.crunchyroll.com/";
          }
          {
            label = "Babbel";
            url = "https://babbel.com";
          }
          {
            label = "ProtonDB";
            url = "https://www.protondb.com/";
          }
          {
            label = "Syncthing";
            url = "http://127.0.0.1:8384/";
          }
          {
            label = "Pocket";
            url = "https://getpocket.com/saves";
          }
        ];
      };

      # Bookmarks port directly (same Firefox format). Full tree incl. Food.
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Edu";
            bookmarks = [
              {
                name = "Khan Academy SAT Prep";
                url = "https://www.khanacademy.org/test-prep/digital-sat";
              }
              {
                name = "TSI";
                url = "https://my.tsi.lv/";
              }
            ];
          }
          {
            name = "Hosted";
            bookmarks = [
              {
                name = "Syncthing";
                url = "http://127.0.0.1:8384/#";
              }
              {
                name = "Tailscale";
                url = "https://login.tailscale.com/admin/machines";
              }
              {
                name = "Nextcloud";
                url = "https://nextcloud.ardishco.net";
              }
            ];
          }
          {
            name = "Tools";
            bookmarks = [
              {
                name = "ChatGPT";
                url = "https://chatgpt.com/";
              }
              {
                name = "Grok AI";
                url = "https://grok.com/";
              }
              {
                name = "Blackbox AI";
                url = "https://www.blackbox.ai/";
              }
            ];
          }
          {
            name = "Nix";
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
                name = "Plasma Manager options";
                url = "https://nix-community.github.io/plasma-manager/options.xhtml";
              }
              {
                name = "nvf docs";
                url = "https://notashelf.github.io/nvf/options.html";
              }
              {
                name = "nixpkgs";
                url = "https://github.com/NixOS/nixpkgs/";
              }
              {
                name = "PR Tracker";
                url = "https://nixpk.gs/pr-tracker.html";
              }
              {
                name = "nixcord options";
                url = "https://flameflag.github.io/nixcord/#sec-options";
              }
              {
                name = "mdadm";
                url = "https://gist.github.com/seanjensengrey/b69ffddbc668e127b1946d4c147e0bcb";
              }
            ];
          }
          {
            name = "Trading";
            bookmarks = [
              {
                name = "coin360";
                url = "https://coin360.com/";
              }
            ];
          }
          {
            name = "Utils";
            bookmarks = [
              {
                name = "Steam Sale Dates";
                url = "https://steamdb.info/sales/history/";
              }
              {
                name = "De-Googled App DB";
                url = "https://plexus.techlore.tech/";
              }
              {
                name = "CyberChef";
                url = "https://gchq.github.io/CyberChef/";
              }
              {
                name = "YT Thumnail";
                url = "https://downdetector.com/";
              }
              {
                name = "Video Embedder";
                url = "https://stolen.shoes/";
              }
              {
                name = "Carrd";
                url = "https://carrd.co/build";
              }
              {
                name = "Flourish";
                url = "https://flourish.studio/";
              }
            ];
          }
          {
            name = "Food";
            bookmarks = [
              {
                name = "Wolt";
                url = "https://wolt.com";
              }
              {
                name = "Yemeksepeti";
                url = "https://www.yemeksepeti.com/istanbul";
              }
              {
                name = "Bolt Food";
                url = "https://food.bolt.eu";
              }
            ];
          }
          {
            name = "Tutorials";
            bookmarks = [
              {
                name = "Davinci Resolve Linux Cheat Sheet";
                url = "https://alecaddd.com/davinci-resolve-ffmpeg-cheatsheet-for-linux/";
              }
              {
                name = "Python w3s";
                url = "https://www.w3schools.com/python/default.asp";
              }
              {
                name = "Godot Docs";
                url = "https://docs.godotengine.org/en/stable/about/introduction.html";
              }
              {
                name = "Git Book";
                url = "https://git-scm.com/book/en/v2";
              }
              {
                name = "Wayland Root";
                url = "https://github.com/swaywm/sway/wiki#wayland-wont-let-me-run-apps-as-root";
              }
              {
                name = "Nginx-Proxy Tutor";
                url = "https://medium.com/@life-is-short-so-enjoy-it/homelab-nginx-proxy-manager-setup-ssl-certificate-with-domain-name-in-cloudflare-dns-732af64ddc0b";
              }
              {
                name = "EasyEffects Pipewire Screensharing";
                url = "https://gist.github.com/amsyarzero/57ff8e566af48265950aead5ff900ce5";
              }
            ];
          }
          {
            name = "Games";
            bookmarks = [
              {
                name = "Jackbox";
                url = "https://jackbox.tv/#/";
              }
            ];
          }
          {
            name = "Anime";
            bookmarks = [
              {
                name = "Filler List";
                url = "https://www.animefillerlist.com/";
              }
              {
                name = "MAL";
                url = "https://myanimelist.net/";
              }
            ];
          }
          {
            name = "Books";
            bookmarks = [ ];
          }
        ];
      };
    };
  };
}
