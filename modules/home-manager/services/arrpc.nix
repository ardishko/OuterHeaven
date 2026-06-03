{ pkgs, ... }:
{
  services.arrpc = {
    enable = false;
    package = pkgs.arrpc;
  };
}
