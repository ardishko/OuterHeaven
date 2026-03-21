{ pkgs, ... }:
{
  security.pam.services.login.kwallet.enable = true;
  environment.systemPackages = with pkgs; [
    kwalletcli
    # kdePackages.kwallet # already in core/other/xdg.nix
    kdePackages.kwallet-pam
    kdePackages.kwalletmanager
  ];
}
