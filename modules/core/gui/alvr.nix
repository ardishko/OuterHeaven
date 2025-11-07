{
  programs.alvr = {
    enable = true;
    openFirewall = true;
  };
  services.wivrn = {
    enable = true;
    openFirewall = true;
    defaultRuntime = true;
  };
}
