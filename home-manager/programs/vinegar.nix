{
  xdg.configFile."vinegar/config.toml".text = ''
    # In case you need some help, here: https://vinegarhq.github.io/Configuration
    [global]
    launcher = "gamemoderun"
    [player]
    forced_version = "version-07c83728577248bd"
    [player.env]
    MANGOHUD = "1"
    [splash]
    background = 0x252836
    foreground = 0xC6D0F5
    [player.fflags]
    DFIntTaskSchedulerTargetFps = 999
  '';
}
