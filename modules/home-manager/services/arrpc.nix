{ pkgs, ... }:
{
  services.arrpc = {
    enable = true;
    package = pkgs.arrpc;
  };
}
