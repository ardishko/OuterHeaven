{ lib, ... }:
{
  systemd.timers.sanoid.timerConfig.OnCalendar = lib.mkForce "00/6:00:00";

  services.sanoid = {
    enable = true;
    templates.clientLight = {
      frequently = 0;
      hourly = 28; # "hourly" class, but only fires every 6h per the timer above -> 1 week retained
      daily = 14;
      monthly = 3;
      yearly = 0;
      autosnap = true;
      autoprune = true;
    };
    datasets."zroot/persist" = {
      useTemplate = [ "clientLight" ];
      recursive = true;
    };
  };
}
