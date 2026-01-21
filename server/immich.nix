{
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
    redis = {
      enable = true;
    };
    machine-learning = {
      enable = false;
    };
  };
  systemd.services.immich-server.preStart = ''
    for dir in upload library thumbs encoded-video profile backups; do
      mkdir -p /var/lib/immich/$dir
      touch /var/lib/immich/$dir/.immich
      chown immich:immich /var/lib/immich/$dir/.immich
    done
  '';
}
