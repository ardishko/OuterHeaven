{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
    group = "jellyfin";
  };
  users = {
    users = {
      jellyfin.extraGroups = [ "media" ];
      media = {};
    };
    groups = {
      media = {};
    };
  };
}
