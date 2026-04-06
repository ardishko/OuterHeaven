{ inputs, username, ... }:
{
  imports = [ inputs.dms.nixosModules.greeter ];
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/${username}";
  };
  services.greetd.settings.default_session.user = "${username}";
  security.pam.services.greetd.enableKwallet = true;
}
