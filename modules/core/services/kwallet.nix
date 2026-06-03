{ pkgs, ... }:
{
  security.pam.services.login.kwallet.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.kwallet
    kdePackages.kwallet-pam
    kdePackages.kwalletmanager
  ];
}
