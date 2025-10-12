{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];
  xdg.desktopEntries = {
    "discord" = lib.mkForce {
      name = "Discord";
      type = "Application";
      icon = "discord";
      terminal = false;
      exec = "mullvad-exclude Discord --enable-features=UseOzonePlatform --ozone-platform=wayland";
    };
  };
  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      package = pkgs.discord;
      vencord = {
        enable = true;
      };
      openASAR.enable = true;
    };
    vesktop = {
      enable = true;
      package = pkgs.vesktop.overrideAttrs (oldAttrs: {
        desktopItems = [
          (pkgs.makeDesktopItem {
            name = "vesktop";
            desktopName = "Vesktop (Discord)";
            exec = "mullvad-exclude vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland";
            icon = "discord";
            startupWMClass = "VencordDesktop";
            genericName = "Internet Messenger";
            keywords = [
              "discord"
              "vencord"
              "electron"
              "chat"
            ];
            categories = [
              "Network"
              "InstantMessaging"
              "Chat"
            ];
          })
        ];
      });
    };
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/ardishco-the-great/catpuccin-discord/main/themes/frappe.theme.css"
      ];
      frameless = false;
      plugins = {
        alwaysTrust.enable = true;
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
        };
        # banger.enable = true;
        betterFolders = {
          enable = true;
          showFolderIcon = "always";
        };
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterNotesBox.enable = true;
        betterRoleDot.enable = true;
        betterUploadButton.enable = true;
        blurNSFW.enable = true;
        reviewDB.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        crashHandler.enable = true;
        dearrow.enable = true;
        experiments.enable = true;
        fakeNitro.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendInvites.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        fixCodeblockGap.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        imageZoom.enable = true;
        loadingQuotes.enable = true;
        memberCount.enable = true;
        messageClickActions.enable = true;
        messageLogger = {
          enable = true;
          deleteStyle = "text";
          logDeletes = true;
          logEdits = true;
          ignoreSelf = true;
        };
        messageTags.enable = true;
        moreCommands.enable = true;
        moreKaomoji.enable = true;
        mutualGroupDMs.enable = true;
        newGuildSettings.enable = true;
        noBlockedMessages = {
          enable = true;
          ignoreBlockedMessages = true;
        };
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        noReplyMention = {
          enable = true;
          userList = "";
          shouldPingListed = false;
        };
        noProfileThemes.enable = true;
        noUnblockToJump.enable = true;
        openInApp.enable = true;
        permissionFreeWill.enable = true;
        pictureInPicture.enable = true;
        pinDMs = {
          enable = true;
          pinOrder = "mostRecent";
        };
        plainFolderIcon.enable = true;
        platformIndicators.enable = true;
        previewMessage.enable = true;
        quickMention.enable = true;
        quickReply.enable = true;
        reactErrorDecoder.enable = true;
        relationshipNotifier.enable = true;
        replaceGoogleSearch = {
          enable = true;
        };
        secretRingToneEnabler.enable = true;
        sendTimestamps.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        silentTyping.enable = true;
        sortFriendRequests.enable = true;
        spotifyControls.enable = true;
        spotifyCrack.enable = true;
        spotifyShareCommands.enable = true;
        translate.enable = true;
        typingIndicator.enable = true;
        # typingTweaks.enable = true;
        unsuppressEmbeds.enable = true;
        userVoiceShow.enable = true;
        USRBG.enable = true;
        vencordToolbox.enable = true;
        viewIcons.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceMessages.enable = true;
        volumeBooster = {
          enable = true;
          multiplier = 5;
        };
        webKeybinds.enable = true;
        webRichPresence.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
        webScreenShareFixes.enable = true;
        noTypingAnimation.enable = true;
      };
    };
  };
}
