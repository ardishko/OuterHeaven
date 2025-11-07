{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
    group = "jellyfin";
  };
  users = {
    users = {
      jellyfin.extraGroups = [ "media" "video" "render" ];
    };
    groups = {
      media = {};
    };
  };
  services.radarr = {
    enable = true;
  };
  services.prowlarr = {
    enable = true;
    openFirewall = true;
  };
  services.readarr = {
    enable = true;
  };
  services.sonarr = {
    enable = true;
  };
  services.bazarr = {
    enable = true;
  };
  services.recyclarr = {
    enable = true;
  };
}
