{ pkgs, ... }:
{
  services.postgresql = {
    package = pkgs.postgresql_16;
  };
}
