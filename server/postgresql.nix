{ pkgs, ... }:
{
  services.postgresql = {
    package = pkgs.postgresql_16;
    # immich, gitlab, nextcloud all depend on this. Don't forget.
  };
}
