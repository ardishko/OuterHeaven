{
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];
  xdg.desktopEntries = {
    "vesktop" = lib.mkForce {
      name = "Discord";
      type = "Application";
      icon = "discord";
      terminal = false;
      exec = "mullvad-exclude vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland";
    };
  };
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
    quickCss = "
    ";
    config = {
      themeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-frappe.theme.css"
      ];
      frameless = false;
      plugins = {
        alwaysTrust.enable = true;
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
        };
        betterFolders = {
          enable = true;
          showFolderIcon = 1;
        };
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterNotesBox.enable = true;
        betterRoleDot.enable = true;
        betterUploadButton.enable = true;
        BlurNSFW.enable = true;
        ReviewDB.enable = true;
        callTimer.enable = true;
        ClearURLs.enable = true;
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
        MutualGroupDMs.enable = true;
        newGuildSettings.enable = true;
        noBlockedMessages = {
          enable = true;
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
        PinDMs = {
          enable = true;
          pinOrder = 1;
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
        viewIcons.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceMessages.enable = true;
        volumeBooster = {
          enable = true;
          multiplier = 5.0;
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
