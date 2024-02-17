{
  xdg.configFile."vinegar/config.toml".text = ''
# In case you need some help, here: https://vinegarhq.github.io/Configuration

[global]
launcher = "mullvad-exclude mangohud --"

[splash]
background = 0x252836
foreground = 0xC6D0F5

[player]
renderer = "Vulkan"
dxvk = false

[player.fflags]
DFIntTaskSchedulerTargetFps = 640 # set to 640 for better performance
  '';
}
