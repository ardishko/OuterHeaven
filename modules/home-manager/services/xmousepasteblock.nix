{ pkgs, ... }:
{
  systemd.user.services.xmousepasteblock = {
    Unit.Description = "Disable middle mouse button paste in Xwayland";
    Service.ExecStart = "${pkgs.xmousepasteblock}/bin/xmousepasteblock";
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
