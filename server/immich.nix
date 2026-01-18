{
  services.immich = {
    enable = true;
    openFirewall = true;
    redis = {
      enable = true;
    };
    machine-learning = {
      enable = false;
    };
  };
}
