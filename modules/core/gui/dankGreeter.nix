{ inputs, username, ... }:
{
  imports = [ inputs.dms.nixosModules.greeter ];
  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/${username}";
  };
}
