{
  pkgs,
  username,
  lib,
  ...
}:
let
  userConfigJson = ''
    [
        {
            "parserType": "Glob",
            "configTitle": "PS3 - RPCS3 (Installed PKG)",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/PS3",
            "steamCategories": [
                "PS3"
            ],
            "executableArgs": "--no-gui \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}/PS3_GAME/USRDIR/@(eboot.bin|EBOOT.BIN)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/rpcs3",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [
                    "PSN"
                ],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176511260875621407",
            "version": 25
        },
        {
            "parserType": "Glob",
            "configTitle": "Switch - Eden",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/Nintendo Switch",
            "steamCategories": [
                "Switch"
            ],
            "executableArgs": "-f -g \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.kip|.KIP|.nca|.NCA|.nro|.NRO|.nso|.NSO|.nsp|.NSP|.xci|.XCI)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/eden",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176511267410361174",
            "version": 25,
            "disabled": false
        },
        {
            "parserType": "Glob",
            "configTitle": "3DS - Azahar",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/3DS",
            "steamCategories": [
                "3DS"
            ],
            "executableArgs": "\"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.3ds|.3DS|.3dsx|.3DSX|.app|.APP|.axf|.AXF|.cci|.CCI|.cxi|.CXI|.elf|.ELF)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/azahar",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176511271940423564",
            "version": 25,
            "disabled": false
        },
        {
            "parserType": "Glob",
            "configTitle": "PS2 - PCSX2",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/PS2",
            "steamCategories": [
                "PS2"
            ],
            "executableArgs": "\"''${filePath}\" -batch -fullscreen -nogui",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.bin|.BIN|.chd|.CHD|.cso|.CSO|.dump|.DUMP|.gz|.GZ|.img|.IMG|.iso|.ISO|.mdf|.MDF|.nrg|.NRG)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/pcsx2-qt",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176511275747530001",
            "version": 25,
            "disabled": false
        },
        {
            "parserType": "Glob",
            "configTitle": "Wii U - Cemu",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/Wii U",
            "steamCategories": [
                "Wii U"
            ],
            "executableArgs": "-f -g \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.iso|.ISO|.wad|.WAD|.wua|.WUA|.wud|.WUD|.wux|.WUX)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/Cemu",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [
                    "WIIU"
                ],
                "caseInsensitiveVariables": true,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": "''${dir}/../*''${/\\[.*?\\]/g|$${title}|}*/meta/iconTex.tga"
            },
            "parserId": "176511299304747928",
            "version": 25,
            "disabled": false
        },
        {
            "parserType": "Glob",
            "configTitle": "Wii - Dolphin",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/dolphin",
            "steamCategories": [
                "Wii"
            ],
            "executableArgs": "-b -e \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.ciso|.CISO|.dol|.DOL|.elf|.ELF|.gcz|.GCZ|.iso|.ISO|.rvz|.RVZ|.wad|.WAD|.wbfs|.WBFS|.wia|.WIA)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/dolphin-emu",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176512185744269453",
            "disabled": false,
            "version": 25
        },
        {
            "parserType": "Glob",
            "configTitle": "N64 - Rosalie's Mupen GUI",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/N64",
            "steamCategories": [
                "N64"
            ],
            "executableArgs": "--fullscreen --nogui --quit-after-emulation \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.7z|.7Z|.n64|.N64|.v64|.V64|.z64|.Z64|.zip|.ZIP)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/RMG",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176512191790124392",
            "version": 25,
            "disabled": false
        },
        {
            "parserType": "Glob",
            "configTitle": "NES - Nestopia",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/NES",
            "steamCategories": [
                "NES"
            ],
            "executableArgs": "-f \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.7z|.7Z|.bz2|.BZ2|.gz|.GZ|.nes|.NES|.fds|.FDS|.unf|.UNF|.xz|.XZ|.zip|.ZIP)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/nestopia",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176512364109354852",
            "version": 25,
            "disabled": false
        },
        {
            "parserType": "Glob",
            "configTitle": "SNES - bsnes",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/SNES",
            "steamCategories": [
                "SNES"
            ],
            "executableArgs": "--fullscreen \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.7z|.7Z|.bs|.BS|.sfc|.SFC|.smc|.SMC|.zip|.ZIP)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/bsnes",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176512368210029383",
            "version": 25,
            "disabled": false
        },
        {
            "parserType": "Glob",
            "configTitle": "PS1 - DuckStation",
            "steamDirectory": "''${steamdirglobal}",
            "romDirectory": "/home/${username}/Games/Emulators/PS1",
            "steamCategories": [
                "PS1"
            ],
            "executableArgs": "-batch -fullscreen \"''${filePath}\"",
            "executableModifier": "\"''${exePath}\"",
            "startInDirectory": "",
            "titleModifier": "''${fuzzyTitle}",
            "fetchControllerTemplatesButton": null,
            "removeControllersButton": null,
            "steamInputEnabled": "1",
            "imageProviders": [
                "sgdb"
            ],
            "onlineImageQueries": [
                "''${fuzzyTitle}"
            ],
            "imagePool": "''${fuzzyTitle}",
            "drmProtect": false,
            "userAccounts": {
                "specifiedAccounts": [
                    "Global"
                ]
            },
            "parserInputs": {
                "glob": "''${title}@(.cue|.CUE|.chd|.CHD|.ecm|.ECM|.iso|.ISO|.m3u|.M3U|.mds|.MDS|.pbp|.PBP)"
            },
            "executable": {
                "path": "/etc/profiles/per-user/${username}/bin/duckstation-qt",
                "shortcutPassthrough": false,
                "appendArgsToExecutable": true
            },
            "titleFromVariable": {
                "limitToGroups": [],
                "caseInsensitiveVariables": false,
                "skipFileIfVariableWasNotFound": false
            },
            "fuzzyMatch": {
                "replaceDiacritics": true,
                "removeCharacters": true,
                "removeBrackets": true
            },
            "controllers": {
                "ps4": null,
                "ps5": null,
                "ps5_edge": null,
                "xbox360": null,
                "xboxone": null,
                "xboxelite": null,
                "switch_joycon_left": null,
                "switch_joycon_right": null,
                "switch_pro": null,
                "neptune": null,
                "steamcontroller_gordon": null
            },
            "imageProviderAPIs": {
                "sgdb": {
                    "nsfw": false,
                    "humor": false,
                    "styles": [],
                    "stylesHero": [],
                    "stylesLogo": [],
                    "stylesIcon": [],
                    "imageMotionTypes": [
                        "static"
                    ],
                    "sizes": [],
                    "sizesHero": [],
                    "sizesTall": null,
                    "sizesIcon": []
                }
            },
            "defaultImage": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "localImages": {
                "tall": "",
                "long": "",
                "hero": "",
                "logo": "",
                "icon": ""
            },
            "parserId": "176512425260998554",
            "disabled": false,
            "version": 25
        }
    ]
  '';

  userSettingsJson = ''
        {
    	"fuzzyMatcher": {
    		"timestamps": {
    			"check": 1765112194187,
    			"download": 1765112194187
    		},
    		"verbose": false,
    		"filterProviders": true
    	},
    	"environmentVariables": {
    		"steamDirectory": "/home/${username}/.steam/steam",
    		"userAccounts": [],
    		"romsDirectory": "",
    		"retroarchPath": "",
    		"raCoresDirectory": "",
    		"localImagesDirectory": ""
    	},
    	"previewSettings": {
    		"retrieveCurrentSteamImages": true,
    		"disableCategories": false,
    		"deleteDisabledShortcuts": false,
    		"imageZoomPercentage": 30,
    		"imageLoadStrategy": "loadLazy",
    		"hideUserAccount": false,
    		"imageTypes": "tall"
    	},
    	"enabledProviders": [
    		"sgdb",
    		"steamCDN"
    	],
    	"batchDownloadSize": 50,
    	"dnsServers": [],
    	"language": "en-US",
    	"theme": "Deck",
    	"emudeckInstall": false,
    	"autoUpdate": true,
    	"offlineMode": false,
    	"navigationWidth": 476,
    	"clearLogOnTest": false,
    	"autoKillSteam": false,
    	"autoRestartSteam": false,
    	"version": 10
        }
  '';
in
{
  # Games directories on ShadowMoses are symlinked from ~/Games/Emulators/ to actual actual games dirs on
  home.packages = with pkgs; [
    steam-rom-manager
    sgdboop
  ];

  home.activation.steam-rom-manager-config = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        CONFIG_DIR="$HOME/.config/steam-rom-manager/userData"
        mkdir -p "$CONFIG_DIR"

        # Always overwrite to ensure config stays in sync with Nix definition
        cat > "$CONFIG_DIR/userConfigurations.json" << 'EOF'
    ${userConfigJson}
    EOF

        cat > "$CONFIG_DIR/userSettings.json" << 'EOF'
    ${userSettingsJson}
    EOF
  '';
}
