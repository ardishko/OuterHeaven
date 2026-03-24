{
  config,
  osConfig,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dsearch.homeModules.default
  ];
  programs.dank-material-shell = {
    enable = true;
    dgop.package = inputs.unstable.legacyPackages.${pkgs.system}.dgop;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = false;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboardPaste = true;
    settings = {
      currentThemeName = "custom";
      currentThemeCategory = "registry";

      # This file must exist on disk. Manage it separately or via home.file.
      customThemeFile = "${config.xdg.configHome}/DankMaterialShell/themes/catppuccin/theme.json";

      registryThemeVariants = {
        catppuccin = {
          dark = {
            flavor = "frappe";
            accent = "sky";
          };
        };
      };
      popupTransparency = 1;
      dockTransparency = 1;
      widgetBackgroundColor = "sch";
      widgetColorMode = "default";
      controlCenterTileColorMode = "primary";
      buttonColorMode = "primary";
      cornerRadius = 12;
      firstDayOfWeek = -1;
      use24HourClock = true;
      showSeconds = false;
      padHours12Hour = false;
      useFahrenheit = false;
      windSpeedUnit = "kmh";
      nightModeEnabled = false;
      animationSpeed = 1;
      customAnimationDuration = 500;
      syncComponentAnimationSpeeds = true;
      popoutAnimationSpeed = 1;
      popoutCustomAnimationDuration = 150;
      modalAnimationSpeed = 1;
      modalCustomAnimationDuration = 150;
      enableRippleEffects = true;
      m3ElevationEnabled = true;
      m3ElevationIntensity = 12;
      m3ElevationOpacity = 30;
      m3ElevationColorMode = "default";
      m3ElevationLightDirection = "top";
      m3ElevationCustomColor = "#000000";
      modalElevationEnabled = true;
      popoutElevationEnabled = true;
      barElevationEnabled = true;
      wallpaperFillMode = "Fill";
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;
      showLauncherButton = true;
      showWorkspaceSwitcher = true;
      showFocusedWindow = true;
      showWeather = true;
      showMusic = true;
      showClipboard = true;
      showCpuUsage = true;
      showMemUsage = true;
      showCpuTemp = true;
      showGpuTemp = true;
      selectedGpuIndex = 0;
      enabledGpuPciIds = [ ];
      showSystemTray = true;
      showClock = true;
      showNotificationButton = true;
      showBattery = true;
      showControlCenterButton = true;
      showCapsLockIndicator = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowAudioIcon = true;
      controlCenterShowAudioPercent = false;
      controlCenterShowVpnIcon = true;
      controlCenterShowBrightnessIcon = false;
      controlCenterShowBrightnessPercent = false;
      controlCenterShowMicIcon = false;
      controlCenterShowMicPercent = true;
      controlCenterShowBatteryIcon = false;
      controlCenterShowPrinterIcon = false;
      controlCenterShowScreenSharingIcon = true;
      showPrivacyButton = true;
      privacyShowMicIcon = false;
      privacyShowCameraIcon = false;
      privacyShowScreenShareIcon = false;
      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enabled = true;
          width = 50;
          deviceName = "leds:igc-0800-led0";
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "nightMode";
          enabled = true;
          width = 50;
        }
        {
          id = "darkMode";
          enabled = true;
          width = 50;
        }
      ];
      showWorkspaceIndex = false;
      showWorkspaceName = false;
      showWorkspacePadding = false;
      workspaceScrolling = false;
      showWorkspaceApps = false;
      workspaceDragReorder = true;
      maxWorkspaceIcons = 3;
      workspaceAppIconSizeOffset = 0;
      groupWorkspaceApps = true;
      workspaceFollowFocus = false;
      showOccupiedWorkspacesOnly = false;
      reverseScrolling = false;
      dwlShowAllTags = false;
      workspaceActiveAppHighlightEnabled = false;
      workspaceColorMode = "default";
      workspaceOccupiedColorMode = "none";
      workspaceUnfocusedColorMode = "default";
      workspaceUrgentColorMode = "default";
      workspaceFocusedBorderEnabled = false;
      workspaceFocusedBorderColor = "primary";
      workspaceFocusedBorderThickness = 2;
      workspaceNameIcons = { };
      waveProgressEnabled = true;
      scrollTitleEnabled = true;
      audioVisualizerEnabled = true;
      audioScrollMode = "volume";
      audioWheelScrollAmount = 5;
      clockCompactMode = false;
      focusedWindowCompactMode = false;
      runningAppsCompactMode = true;
      barMaxVisibleApps = 0;
      barMaxVisibleRunningApps = 0;
      barShowOverflowBadge = true;
      appsDockHideIndicators = false;
      appsDockColorizeActive = false;
      appsDockActiveColorMode = "primary";
      appsDockEnlargeOnHover = false;
      appsDockEnlargePercentage = 125;
      appsDockIconSizePercentage = 100;
      keyboardLayoutNameCompactMode = false;
      runningAppsCurrentWorkspace = true;
      runningAppsGroupByApp = false;
      runningAppsCurrentMonitor = false;
      appIdSubstitutions = [ ];
      centeringMode = "index";
      clockDateFormat = "";
      lockDateFormat = "";
      greeterRememberLastSession = true;
      greeterRememberLastUser = true;
      greeterEnableFprint = false;
      greeterEnableU2f = false;
      greeterWallpaperPath = "";
      greeterUse24HourClock = true;
      greeterShowSeconds = false;
      greeterPadHours12Hour = false;
      greeterLockDateFormat = "";
      greeterFontFamily = "";
      greeterWallpaperFillMode = "";
      mediaSize = 1;
      appLauncherViewMode = "list";
      spotlightModalViewMode = "list";
      browserPickerViewMode = "grid";
      browserUsageHistory = { };
      appPickerViewMode = "grid";
      filePickerUsageHistory = { };
      sortAppsAlphabetically = true;
      appLauncherGridColumns = 4;
      spotlightCloseNiriOverview = true;
      spotlightSectionViewModes = { };
      appDrawerSectionViewModes = { };
      niriOverviewOverlayEnabled = true;
      dankLauncherV2Size = "medium";
      dankLauncherV2BorderEnabled = true;
      dankLauncherV2BorderThickness = 2;
      dankLauncherV2BorderColor = "primary";
      dankLauncherV2ShowFooter = true;
      dankLauncherV2UnloadOnClose = false;
      useAutoLocation = true;
      weatherEnabled = true;
      networkPreference = "wifi";
      iconTheme = "Papirus-Dark";

      cursorSettings = {
        theme = "catppuccin-frappe-dark-cursors";
        size = 24;
        niri = {
          hideWhenTyping = false;
          hideAfterInactiveMs = 0;
        };
        hyprland = {
          hideOnKeyPress = false;
          hideOnTouch = false;
          inactiveTimeout = 0;
        };
        dwl.cursorHideTimeout = 0;
      };
      launcherLogoMode = "os";
      launcherLogoCustomPath = "";
      launcherLogoColorOverride = "primary";
      launcherLogoColorInvertOnMode = false;
      launcherLogoBrightness = 0.5;
      launcherLogoContrast = 1;
      launcherLogoSizeOffset = 0;
      fontFamily = "IosevkaTerm Nerd Font Mono";
      monoFontFamily = "Fira Code";
      fontWeight = 400;
      fontScale = 1.11;
      notepadUseMonospace = true;
      notepadFontFamily = "";
      notepadFontSize = 14;
      notepadShowLineNumbers = false;
      notepadTransparencyOverride = -1;
      notepadLastCustomTransparency = 0.7;
      soundsEnabled = true;
      useSystemSoundTheme = false;
      soundNewNotification = true;
      soundVolumeChanged = true;
      soundPluggedIn = true;
      acMonitorTimeout = 0;
      acLockTimeout = 0;
      acSuspendTimeout = 0;
      acSuspendBehavior = 0;
      acProfileName = "";
      batteryMonitorTimeout = 0;
      batteryLockTimeout = 0;
      batterySuspendTimeout = 0;
      batterySuspendBehavior = 0;
      batteryProfileName = "";
      batteryChargeLimit = 100;
      lockBeforeSuspend = false;
      loginctlLockIntegration = true;
      fadeToLockEnabled = true;
      fadeToLockGracePeriod = 5;
      fadeToDpmsEnabled = true;
      fadeToDpmsGracePeriod = 5;
      launchPrefix = "";
      brightnessDevicePins = { };
      wifiNetworkPins = { };
      bluetoothDevicePins = { };
      audioInputDevicePins = { };
      # NOTE: contains bluetooth MAC address — replace or remove if desired
      audioOutputDevicePins = {
        preferredOutput = [
          "alsa_output.pci-0000_03_00.1.hdmi-stereo-extra2"
          "bluez_output.80_99_E7_ED_1A_D0.1"
        ];
      };
      gtkThemingEnabled = false;
      qtThemingEnabled = false;
      syncModeWithPortal = false;
      runDmsMatugenTemplates = false;
      runUserMatugenTemplates = false;
      terminalsAlwaysDark = false;
      showDock = true;
      dockAutoHide = false;
      dockSmartAutoHide = true;
      dockGroupByApp = false;
      dockRestoreSpecialWorkspaceOnClick = false;
      dockOpenOnOverview = false;
      dockPosition = 1;
      dockSpacing = 4;
      dockBottomGap = -8;
      dockMargin = 7;
      dockIconSize = 60;
      dockIndicatorStyle = "circle";
      dockBorderEnabled = true;
      dockBorderColor = "surfaceText";
      dockBorderOpacity = 1;
      dockBorderThickness = 1;
      dockIsolateDisplays = false;
      dockLauncherEnabled = true;
      dockLauncherLogoMode = "apps";
      dockLauncherLogoCustomPath = "";
      dockLauncherLogoColorOverride = "primary";
      dockLauncherLogoSizeOffset = 0;
      dockLauncherLogoBrightness = 0.5;
      dockLauncherLogoContrast = 1;
      dockMaxVisibleApps = 0;
      dockMaxVisibleRunningApps = 0;
      dockShowOverflowBadge = true;
      notificationOverlayEnabled = false;
      notificationPopupShadowEnabled = true;
      notificationPopupPrivacyMode = false;
      modalDarkenBackground = true;
      lockScreenShowPowerActions = true;
      lockScreenShowSystemIcons = true;
      lockScreenShowTime = true;
      lockScreenShowDate = true;
      lockScreenShowProfileImage = true;
      lockScreenShowPasswordField = true;
      lockScreenShowMediaPlayer = true;
      lockScreenPowerOffMonitorsOnLock = false;
      lockAtStartup = false;
      enableFprint = false;
      maxFprintTries = 15;
      enableU2f = false;
      u2fMode = "or";
      lockScreenActiveMonitor = "all";
      lockScreenInactiveColor = "#000000";
      lockScreenNotificationMode = 0;
      lockScreenVideoEnabled = false;
      lockScreenVideoPath = "";
      lockScreenVideoCycling = false;
      hideBrightnessSlider = false;
      notificationTimeoutLow = 5000;
      notificationTimeoutNormal = 5000;
      notificationTimeoutCritical = 0;
      notificationCompactMode = false;
      notificationPopupPosition = 0;
      notificationAnimationSpeed = 1;
      notificationCustomAnimationDuration = 400;
      notificationHistoryEnabled = true;
      notificationHistoryMaxCount = 50;
      notificationHistoryMaxAgeDays = 7;
      notificationHistorySaveLow = true;
      notificationHistorySaveNormal = true;
      notificationHistorySaveCritical = true;
      notificationRules = [ ];
      notificationFocusedMonitor = false;
      osdAlwaysShowValue = true;
      osdPosition = 5;
      osdVolumeEnabled = true;
      osdMediaVolumeEnabled = true;
      osdMediaPlaybackEnabled = false;
      osdBrightnessEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMicMuteEnabled = true;
      osdCapsLockEnabled = true;
      osdPowerProfileEnabled = true;
      osdAudioOutputEnabled = true;
      powerActionConfirm = true;
      powerActionHoldDuration = 0.5;
      powerMenuActions = [
        "reboot"
        "logout"
        "poweroff"
        "lock"
        "suspend"
        "restart"
      ];
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = false;
      customPowerActionLock = "";
      customPowerActionLogout = "";
      customPowerActionSuspend = "";
      customPowerActionHibernate = "";
      customPowerActionReboot = "";
      customPowerActionPowerOff = "";
      updaterHideWidget = false;
      updaterUseCustomCommand = false;
      updaterCustomCommand = "";
      updaterTerminalAdditionalParams = "";
      displayNameMode = "system";
      screenPreferences = { };
      showOnLastDisplay = { };
      niriOutputSettings = { };
      hyprlandOutputSettings = { };
      displayProfiles = { };
      activeDisplayProfile = { };
      displayProfileAutoSelect = false;
      displayShowDisconnected = false;
      displaySnapToEdge = true;
      barConfigs = [
        {
          id = "default";
          name = "Main Bar";
          enabled = true;
          position = 0;
          screenPreferences = [ "all" ];
          showOnLastDisplay = true;
          leftWidgets = [
            "launcherButton"
            "workspaceSwitcher"
            "focusedWindow"
          ];
          centerWidgets = [
            "music"
            "clock"
            "weather"
          ];
          rightWidgets = [
            {
              id = "keyboard_layout_name";
              enabled = true;
              keyboardLayoutNameCompactMode = true;
            }
            {
              id = "systemTray";
              enabled = true;
            }
            {
              id = "clipboard";
              enabled = true;
            }
            {
              id = "cpuUsage";
              enabled = true;
            }
            {
              id = "memUsage";
              enabled = true;
            }
            {
              id = "notificationButton";
              enabled = true;
            }
            {
              id = "battery";
              enabled = true;
            }
            {
              id = "vpn";
              enabled = true;
            }
            {
              id = "controlCenterButton";
              enabled = true;
            }
          ];
          spacing = 4;
          innerPadding = 4;
          bottomGap = 0;
          transparency = 1;
          widgetTransparency = 1;
          squareCorners = false;
          noBackground = false;
          maximizeWidgetIcons = false;
          maximizeWidgetText = false;
          removeWidgetPadding = false;
          widgetPadding = 8;
          gothCornersEnabled = false;
          gothCornerRadiusOverride = false;
          gothCornerRadiusValue = 12;
          borderEnabled = false;
          borderColor = "surfaceText";
          borderOpacity = 1;
          borderThickness = 1;
          widgetOutlineEnabled = false;
          widgetOutlineColor = "primary";
          widgetOutlineOpacity = 1;
          widgetOutlineThickness = 1;
          fontScale = 1;
          iconScale = 1;
          autoHide = false;
          autoHideDelay = 250;
          showOnWindowsOpen = false;
          openOnOverview = false;
          visible = true;
          popupGapsAuto = true;
          popupGapsManual = 4;
          maximizeDetection = true;
          scrollEnabled = true;
          scrollXBehavior = "column";
          scrollYBehavior = "workspace";
          shadowIntensity = 0;
          shadowOpacity = 60;
          shadowColorMode = "default";
          shadowCustomColor = "#000000";
          clickThrough = false;
        }
      ];
      desktopClockEnabled = false;
      desktopClockStyle = "analog";
      desktopClockTransparency = 0.8;
      desktopClockColorMode = "primary";
      desktopClockCustomColor = {
        r = 1;
        g = 1;
        b = 1;
        a = 1;
        hsvHue = -1;
        hsvSaturation = 0;
        hsvValue = 1;
        hslHue = -1;
        hslSaturation = 0;
        hslLightness = 1;
        valid = true;
      };
      desktopClockShowDate = true;
      desktopClockShowAnalogNumbers = false;
      desktopClockShowAnalogSeconds = true;
      desktopClockX = -1;
      desktopClockY = -1;
      desktopClockWidth = 280;
      desktopClockHeight = 180;
      desktopClockDisplayPreferences = [ "all" ];
      systemMonitorEnabled = false;
      systemMonitorShowHeader = true;
      systemMonitorTransparency = 0.8;
      systemMonitorColorMode = "primary";
      systemMonitorCustomColor = {
        r = 1;
        g = 1;
        b = 1;
        a = 1;
        hsvHue = -1;
        hsvSaturation = 0;
        hsvValue = 1;
        hslHue = -1;
        hslSaturation = 0;
        hslLightness = 1;
        valid = true;
      };
      systemMonitorShowCpu = true;
      systemMonitorShowCpuGraph = true;
      systemMonitorShowCpuTemp = true;
      systemMonitorShowGpuTemp = false;
      systemMonitorGpuPciId = "";
      systemMonitorShowMemory = true;
      systemMonitorShowMemoryGraph = true;
      systemMonitorShowNetwork = true;
      systemMonitorShowNetworkGraph = true;
      systemMonitorShowDisk = true;
      systemMonitorShowTopProcesses = false;
      systemMonitorTopProcessCount = 3;
      systemMonitorTopProcessSortBy = "cpu";
      systemMonitorGraphInterval = 60;
      systemMonitorLayoutMode = "auto";
      systemMonitorX = -1;
      systemMonitorY = -1;
      systemMonitorWidth = 320;
      systemMonitorHeight = 480;
      systemMonitorDisplayPreferences = [ "all" ];
      systemMonitorVariants = [ ];
      desktopWidgetPositions = { };
      desktopWidgetGridSettings = { };
      desktopWidgetInstances = [ ];
      desktopWidgetGroups = [ ];
      builtInPluginSettings = {
        dms_settings_search.trigger = "?";
      };
      clipboardEnterToPaste = false;
      launcherPluginVisibility = { };
      launcherPluginOrder = [ ];
      configVersion = 6;
    };
  };

  programs.dank-material-shell.session = {
    monitorWallpapers =
      if (osConfig.users.users.${config.home.username}.description == "vaporsnake") then
        {
          "DP-2" = "${../../../../assets/wallpapers/strawHats.png}";
        }
      else if (osConfig.users.users.${config.home.username}.description == "liquid") then
        {
          "eDP-1" = "${../../../../assets/wallpapers/berserk-catppuccin.png}";
        }
      else
        { };
  };
  programs.dsearch = {
    enable = true;
  };
  xdg.configFile."DankMaterialShell/themes/catppuccin/theme.json" = {
    source = ./theme.json;
  };
}
