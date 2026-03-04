{ pkgs, ... }:
{
  servicespostgresql = {
    package = pkgs.postgresql_16;
  };
}
